# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Update dotfiles
function upDotfiles() {
  cd
  files=(.gitconfig .npmrc .vimrc .zshrc env.sh functions.sh)
  for file in ${files[@]}; do
    echo "copying $file"
    cp $file Dotfiles
  done
  echo copying snippets
  cp -R .vim/my_snippets Dotfiles
  cd Dotfiles
  echo doing brew bundle
  brew bundle dump --force
  echo pusing to git
  # git add .
  # git commit -m "Update dotfiles"
  # git push -u origin master
}

alias dcr='docker-compose run --rm app'

alias dcrra='docker-compose run --rm app rails'

alias dcrdbm='docker-compose run --rm app rails db:migrate'
alias dcrdbr='docker-compose run --rm app rails db:reset'
alias dcrdbs='docker-compose run --rm app rails db:seed'

alias dcrgm='docker-compose run --rm app rails generate migration'

alias dcrspec='docker-compose run --rm test rspec'
