#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

function doIt() {
	rsync --exclude ".git/" \
	      --exclude ".gitignore" \
	      --exclude ".DS_Store" \
		  --exclude "bootstrap.sh" \
		  --exclude "brew.sh" \
		  --exclude "README.md" \
          --exclude "Makefile" \
          --exclude "terminal-config.json" \
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
