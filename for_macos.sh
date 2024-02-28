#!/bin/bash

which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    # Make sure we’re using the latest Homebrew.
    brew update

    # Upgrade any already-installed formulae.
    brew upgrade
fi

#Install curl
brew install curl

# Install git
brew install git

# Install asdf
brew install asdf

# Install ZSH
brew install zsh

# install powerlevel10k
brew install romkatv/powerlevel10k/powerlevel10k

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
# brew install vim

# Install NeoVim
brew install neovim

# Install font-fira-code
brew tap homebrew/cask-fonts
brew install --cask font-fira-code

# Instal hhtpie
brew install httpie

# Install kubectl
brew install kubectl

# Install DBeaver
# brew install --cask dbeaver-community

# Install Spotify
brew install --cask spotify

# Install AWS Cli
brew install awscli
