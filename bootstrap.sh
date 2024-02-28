#!/bin/zsh

dotfiles_folder="$(pwd)"

dotfiles=("aliases" "functions" "exports" "extra" "p10k.zsh" "zshrc" "zprofile")

for file in "${dotfiles[@]}"; do
    dotfile="$dotfiles_folder/.$file"
    link_dest="$HOME/.$file"

    if [ -e "$link_dest" ] || [ -L "$link_dest" ]; then
        echo "Removing existing link: $link_dest"
        rm "$link_dest"
    fi

    echo "Creating symbolic link: $link_dest"
    ln -s "$dotfile" "$link_dest"
done

# custom user astrovim
nvim_user="$HOME/.config/nvim/lua/user"
if [ ! -L "$nvim_user" ]; then
    ln -s "$dotfiles_folder/nvim/user" "$nvim_user"
fi
