# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# ZSH_THEME="robbyrussell"

plugins=(git branch brew colorize django docker docker-compose docker-machine git-extras github gitignore nmap pep8 python pylint virtualenv zsh-syntax-highlighting zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
if [[ ! -f ~/.p10k.zsh ]]; then
  source ~/.p10k.zsh
else
  ZSH_THEME="powerlevel10k/powerlevel10k"
fi
