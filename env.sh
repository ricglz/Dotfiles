# Add commonly used folders to $PATH
export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="${HOME}/.npm-packages/bin:/usr/local/opt/python/libexec/bin:$PATH"
export PATH="/usr/local/lib/ruby/gems/2.6.0/bin:$PATH:$HOME/.rvm/bin"
export PATH="$HOME/.rbenv/bin:$PATH"

export PYTHONUSERBASE="${HOME}/myappenv"

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=vim

# Other exports
export LANG=en_US.UTF-8
export DEFAULT_USER=`whoami` # Removes user name and dispositve name in terminal

alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dcb='docker-compose build'

alias bri='brew install'
alias cask='brew cask'
alias caski='brew cask install'

alias bupgr='brew upgrade && brew cask upgrade && brew cleanup && brew doctor'
alias nupgr='npm update -g'
