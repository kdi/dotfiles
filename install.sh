#!/bin/bash
#
# install things...

# Don't assume everyone's on OS X...
platform='unknown'
os=`uname`
if [[ "$os" == 'Linux' ]]; then
	# do stuff for linux
	platform='linux'
elif [[ "$os" == 'Darwin' ]]; then
	# Homebrew (*nix-ers beware)
	platform='osx'
	. setup/homebrew
fi

# setup other software
. setup/node
. setup/bash

cd ~
# backup existing dotfiles
mkdir -p ~/.dotfiles.bak/
cp ~/.* ~/.dotfiles.bak/

echo "Your original .bash_profile has been backed up to .bash_profile.bak"


cd "$(dirname "$0")"
git pull

function doIt() {
	rsync --exclude ".git/" --exclude "script/" --exclude ".DS_Store" --exclude "install.sh" --exclude "readme.md" -av . ~
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile