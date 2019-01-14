# Add commonly used folders to $PATH
export PATH="/usr/local/opt/ruby/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"

export PYTHONUSERBASE="${HOME}/myappenv"
export PATH="/usr/local/lib/ruby/gems/2.5.0/gems/travis-1.8.9/bin:${HOME}/.npm-packages/bin:/usr/local/opt/python/libexec/bin:$PATH"

# Specify default editor. Possible values: vim, nano, ed etc.
export EDITOR=vim

# Other exports
export LANG=en_US.UTF-8
export DEFAULT_USER=`whoami`

# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

function ghcontrib() {
  repo=$(basename $(pwd))
  githubcontrib --owner ricglz0201 --repo $repo --cols 6 --showlogin true --filter gitter-badger --sortOrder desc | pbcopy
}

# Add rbenv to bash so that it loads every time you open a terminal
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Example aliases
alias cppcompile='c++ -std=c++11 -stdlib=libc++'

alias dcup='docker-compose up'
alias dcdn='docker-compose down'
alias dcr='docker-compose run --rm app'

alias dcrra='docker-compose run --rm app rails'

alias dcrdbm='docker-compose run --rm app rails db:migrate'
alias dcrdbr='docker-compose run --rm app rails db:reset'
alias dcrdbs='docker-compose run --rm app rails db:seed'

alias bupgr='brew upgrade && brew cleanup'
alias nupgr='npm update -g'
