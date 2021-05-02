# Load the shell dotfiles, and then some:

# Include custom aliases
if [[ -f ~/.sdkman/bin/sdkman-init.sh ]]; then
  source ~/.sdkman/bin/sdkman-init.sh
fi

# * ~/.path can be used to extend `$PATH`.
# * ~/.extra can be used for other settings you don’t want to commit.
for file in ~/.{path,aliases,exports,extra,functions,private,tokens}; do
	[ -r "$file" ] && [ -f "$file" ] && source "$file";
done;
unset file;
