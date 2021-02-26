#!/usr/bin/env bash

ver="v0.0.1"

# Variables

current_date=$(echo $(date '+%Y-%m-%d'))

target_entry_id=$1

light_scan_flags="--top-ports 100 --open -Pn"
heavy_scan_a_flags="-p- -sT --host-timeout 10m --reason -Pn"
heavy_scan_b_flags="-sC -sV -A --reason -Pn"

# Colors

C_RESET="\033[0m"
C_RED="\033[1;31m"
C_GREEN="\033[1;32m"
C_YELLOW="\033[1;33m"

echo " "
echo -e "Nmap scan of new machine"

# Import and process data about target

target_entry=$(bugout entries get -i $target_entry_id)
target_entry_title_raw=$(echo "$target_entry" | jq ".title")
target_entry_tags_raw=$(echo "$target_entry" | jq ".tags[]")
target_entry_content_raw=$(echo "$target_entry" | jq ".content")
target_entry_content=${target_entry_content_raw//\"}
# Extract only IP from tags
target_ip_raw=$(echo "$target_entry_tags_raw" | awk '/[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+/{print $0}')

# Remove quotes around tags
target_ip=${target_ip_raw//\"}
target_entry_title=${target_entry_title_raw//\"}
target_entry_tags=${target_entry_tags_raw//\"}

# Split tags by comma
target_entry_tags_comma=$(echo $target_entry_tags | sed 's/ /,/g')

echo " "
echo -e "Extracted ${C_YELLOW}$target_entry_title${C_RESET} with IP: ${C_YELLOW}$target_ip${C_RESET}"

# Start light nmap scan

echo " "
echo "Start nmap light scan"
nmap_scan_light=$(nmap $target_ip $light_scan_flags)
nmap_scan_light_content="
# Nmap light scan result
\`\`\`bash
$nmap_scan_light
\`\`\`
"

sleep 3
bugout entries create --title "$target_entry_title nmap light" --tags "$target_entry_tags_comma,nmap" --content "$nmap_scan_light_content"

# Start heavy nmap scan

echo " "
echo "Start nmap scan heavy A"
nmap_scan_a=$(nmap $target_ip $heavy_scan_a_flags)
# Select only ports from nmap output
nmap_scan_a_ports_raw=$(echo "$nmap_scan_a" | grep -oP '([0-9]+)(?=\/udp|\/tcp)')
# Replace \n and split by comma
nmap_scan_a_ports=$(echo "$nmap_scan_a_ports_raw" | tr '\n' ',' | sed 's/,$//g')

echo " "
echo -e "Start nmap scan B with ports: ${C_YELLOW}$nmap_scan_a_ports${C_RESET}"
nmap_scan_b=$(nmap $target_ip -p $nmap_scan_a_ports $heavy_scan_b_flags)
nmap_scan_b_content="
# Nmap heavy scan A
\`\`\`bash
$nmap_scan_a
\`\`\`
# Nmap heavy scan B
\`\`\`bash
$nmap_scan_b
\`\`\`
"

sleep 3
bugout entries create --title "$target_entry_title nmap heavy" --tags "$target_entry_tags_comma,nmap" --content "$nmap_scan_b_content"

# Update main target entry

echo " "
echo "Update main target entry"

target_entry_content_updated="
$target_entry_content

### Available ports
$nmap_scan_a_ports
"

sleep 3
bugout entries update --id "$target_entry_id" --title "$target_entry_title" --content "$target_entry_content_updated"
