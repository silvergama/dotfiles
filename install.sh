#!/usr/bin/env bash

which -s zsh
if [[ $? != 0 ]]; then
  # install oh-my-zsh
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi
