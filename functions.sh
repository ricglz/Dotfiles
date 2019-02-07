# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Update dotfiles
function upDotfiles() {
  cd
  files=(.gitconfig .npmrc .vimrc .zshrc env.sh functions.sh .vim/my_snippets)
  for file in ${files[@]}; do
    echo "copying $file"
    if [[ -d $file ]] then
      cp -R $file Dotfiles
    else
      cp $file Dotfiles
    fi
  done
  cd Dotfiles
  echo doing brew bundle
  brew bundle dump --force
  echo pusing to git
  git add .
  git commit -m "Update dotfiles"
  git push -u origin master
}

