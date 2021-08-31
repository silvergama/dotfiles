#!/bin/bash

if ! [ -n "$(which zsh)" ]; then
  sudo apt install zsh -y
fi

if ! [ -n "$(which spotify)" ]; then
  snap install spotify
fi
