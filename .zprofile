# Load the shell dotfiles, and then some:

# Include custom aliases
if [ -f ~/.sdkman/bin/sdkman-init.sh ]; then
  source ~/.sdkman/bin/sdkman-init.sh
fi

if [ -f /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

if [ -f /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

if [ -f /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme ]; then
  source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme
fi


# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,aliases,exports,extra,functions,private,tokens,zshenv}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
