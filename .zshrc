# Setup antibody
autoload -Uz compinit && compinit -C

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt > ~/.zsh_plugins.sh
source ~/.zsh_plugins.sh
source ~/.exports
source ~/extra.zsh
