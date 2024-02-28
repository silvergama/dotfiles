export ZSH="$HOME/.oh-my-zsh"
plugins=(git branch brew colorize docker docker-compose docker-machine git-extras github gitignore nmap pep8 python pylint virtualenv asdf golang zsh-autosuggestions zsh-completions zsh-history-substring-search)
source $ZSH/oh-my-zsh.sh

ZSH_THEME="powerlevel10k/powerlevel10k" 

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
