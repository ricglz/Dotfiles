# Path to your oh-my-zsh installation.
export ZSH="/Users/ricglz/.oh-my-zsh"
ZSH_THEME="agnoster" 
DISABLE_UNTRACKED_FILES_DIRTY="true"
plugins=(
  git
)
source $ZSH/oh-my-zsh.sh
source ~/env.sh

# added by travis gem
[ -f /Users/ricglz/.travis/travis.sh ] && source /Users/ricglz/.travis/travis.sh
