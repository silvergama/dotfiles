if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -U compinit
    compinit -i
fi
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

plugins=(git branch brew colorize docker docker-compose docker-machine git-extras github gitignore nmap pep8 python pylint virtualenv asdf zsh-autosuggestions zsh-completions
    zsh-history-substring-search zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
ZSH_THEME="powerlevel10k/powerlevel10k"
source ~/.p10k.zsh
# source ~/powerlevel10k/powerlevel10k.zsh-theme
source /usr/local/opt/powerlevel10k/powerlevel10k.zsh-theme

if [ -f "${HOME}/.sdkman/bin/sdkman-init.sh" ]; then source "${HOME}/.sdkman/bin/sdkman-init.sh"; fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f "${HOME}/google-cloud-sdk/path.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/path.zsh.inc"; fi

# The next line enables shell command completion for gcloud.
if [ -f "${HOME}/google-cloud-sdk/completion.zsh.inc" ]; then . "${HOME}/google-cloud-sdk/completion.zsh.inc"; fi

if [ -f '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc' ]; then . '/usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc'; fi
compdef __start_kubectl k

eval $(/usr/local/bin/brew shellenv)

. ~/.asdf/plugins/golang/set-env.zsh

