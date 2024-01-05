#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
				--exclude ".gitignore" \
				--exclude ".DS_Store" \
				--exclude "nvim/" \
				--exclude "bootstrap.sh" \
				--exclude "for_all_os.sh" \
				--exclude "for_macos.sh" \
				--exclude "for_linux.sh" \
				--exclude "Makefile" \
				--exclude "README.md" \
				--exclude "terminal-config.json" \
				--exclude "gruvbox.itermcolors" \
				-avh --no-perms . ~;
	source ~/.zprofile;
}

if [[ $1 == --force || $1 == -f ]]; then
    doIt;
else
	read "response?This may overwrite existing files in your home directory. Are you sure? (y/n) ";
	if [[ $response =~ ^[Yy]$ ]]; then
		doIt;
	fi;
fi;
unset doIt;

# ln -s ~/Projects/silvergama/dotfiles/nvim/user ~/.config/nvim/lua/user
