#!/usr/bin/env bash

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    # Make sure we’re using the latest Homebrew.
    brew update

    # Upgrade any already-installed formulae.
    brew upgrade
fi

#Install ZSH
brew install zsh zsh-autosuggestions zsh-syntax-highlighting

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils

# Install some other useful utilities like `sponge`.
brew install moreutils

# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils

# Install FZF
brew install fzf

# Install tig
brew install tig

# Install Tree
brew install tree

# Install github cli
brew install gh

# Install vim
brew install vim

# Install font-fira-code
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Instal hhtpie
brew install httpie
