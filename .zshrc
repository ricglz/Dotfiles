# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=powerlevel10k/powerlevel10k
DISABLE_UNTRACKED_FILES_DIRTY="true"
source $ZSH/oh-my-zsh.sh
source ~/.exports
source ~/.alias
source ~/.git_stuff
source ~/.functions
source ~/extra.sh

autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
