
This repo contains files which helps in setting up my new MAC.

This repo is inspired by @hussainweb

Just follow these instructions to use this repo as is. If you are creating your own repository, don't forget to change the git URL in step 3.

Restore your safely backed up ssh keys to ~/.ssh/

Alternatively, generate new ssh keys, and add these to your GitHub account
Install Homebrew and git

/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
Clone this repository (or the one you created)

git clone git@github.com:manojbisht891/dotfiles.git
Run the bootstrap.sh script

Alternatively, only run the setup.sh scripts in specific subfolders if you don't need everything
(Optional) Install missing applications from the internet


Tips:

Package which will be installed are defined in "Bewfile" file under "Packages" folder.

Fish Shell is configured for using instead of BASE or SHELL.
