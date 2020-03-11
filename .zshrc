# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="robbyrussell"
DISABLE_UNTRACKED_FILES_DIRTY="true"
source $ZSH/oh-my-zsh.sh
source ~/.exports
source ~/.alias
source ~/.git_stuff
source ~/.functions
source ~/extra.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
eval "$(rbenv init -)"

# Use key bindings while writing the commands
# bindkey -v
