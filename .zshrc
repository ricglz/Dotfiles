# Setup antibody
autoload -Uz compinit && compinit -C

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh
source ~/.exports
source ~/extra.zsh

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"
eval "$(rbenv init -)"
