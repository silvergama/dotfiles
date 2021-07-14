#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")";

git pull origin master;

doIt() 
{
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

doIt;
unset doIt;
