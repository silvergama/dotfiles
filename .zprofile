# Load the shell dotfiles, and then some:
typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# Include custom aliases
if [[ -f ~/.sdkman/bin/sdkman-init.sh ]]; then
  source ~/.sdkman/bin/sdkman-init.sh
fi

if [[ -f /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]]; then
  source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi 

if [[ -f /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]]; then
  source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi 

# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,aliases,exports,extra,functions,private,tokens}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;

typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
