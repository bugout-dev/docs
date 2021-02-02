# Using Bugout to take notes in VSCode

In this tutorial, you will:
1. Install the Bugout VSCode extension
2. Store your first snippet from VSCode in your personal knowledge base

This tutorial assumes that you have registered for an account at bugout.dev and have verified your
email.

If you just registered for a Bugout.dev account, this is probably what you see when you sign in:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-blank-journals-page.png" alt="An empty Bugout.dev personal journal - a clean slate" width="600"/>

We are going to change this, and we're going to change it from the comfort of VSCode.

### Step 1: Install the Bugout extension in VSCode To install the Bugout extension in VSCode, open the `Extensions` tab in VSCode, either by clicking on its icon on the left-hand side menu:
<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/vscode-extensions.svg" alt="VSCode Extensions icon - four squares composing a larger square, except the top right square is popped off" width="100"/>


You can also access this menu by clicking `Ctrl + Shift + X` if you're on Windows or Linux, `Cmd + Shift + X` if you're on a Mac.

Search for `Bugout`:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-vscode-install.png" alt="Search results for term 'Bugout' showing the Bugout extension (v0.1.2)" width="300"/>

And click `Install`. Once the installation is successful, VSCode should open a tab with the extension
page:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-vscode-postinstall.png" alt="Post-installation page for the Bugout VSCode extension" width="300"/>

### Step 2: Connect your Bugout account to the Bugout VSCode extension
Bugout knowledge bases are secured behind your Bugout account, and you have to provide the Bugout API with a secret proving that you are who you claim to be. You will do this by setting up a Bugout access token in your VSCode settings.

First, generate an access token at https://bugout.dev/account/tokens. You can also get here from the your journals page by clicking on your username in the top right:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-accounts-menu.png" alt="Bugout.dev accounts menu" width="600"/>

then on `Account`, then on `Tokens`:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-tokens-button.png" alt="Bugout.dev tokens menu" width="600"/>

and then by clicking on the `+` button to create a new token.

This will ask you for your Bugout password. Once you have typed in your password, press `Enter`:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-tokens-create.png" alt="Type your Bugout password and press enter" width="600"/>

You will now see an access token:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-tokens-access-token.png" alt="Bugout access token - this one is deidentified: xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx" width="600"/>

Copy that access token!

Now go into your VSCode and enter the settings screen. You can either do this by selecting `File > Preferences > Settings` (this is `Code > Preferences > Settings` on a Mac) or by hitting `Ctrl + ,`. In the `Search settings` bar, type `bugout`:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-vscode-settings.png" alt="" width="600"/>

Paste your access token into the `Bugout: Access Token` setting and click your mouse away:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-vscode-settings-with-access-token.png" alt="Bugout access token" width="800"/>

### Step 3: Store your first snippet from VSCode in your personal knowledge base
Open a new VSCode tab and paste the following text into it:

```
I created this entry from VSCode, following a tutorial at https://github.com/bugout-dev/docs.
```

Now, highlight the text, right click on it, and select `Bugout: Create entry`. You should give the entry
a title and add tags before submitting it to your knowledge base:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-vscode-create-entry.gif" alt="An animation of the workflow to create a knowledge base entry from VSCode" width="600"/>

This note is automatically synchronized to every one of your Bugout clients. For example, you will see it when you go the https://bugout.dev:

<img src="https://s3.amazonaws.com/static.simiotics.com/bugout-dev-docs/bugout-personal-entry-from-vscode.png" alt="Bugout personal journal now has the note from VSCode" width="600"/>

You just created your first Bugout snippet from VSCode. You can use this feature to store code that you want to think on, take notes about, or just discuss with your friends and teammates. Good luck!

- - -

[Back to Bugout documentation home page](../README.md)
