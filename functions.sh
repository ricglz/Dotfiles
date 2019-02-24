# File search functions
function f() { find . -iname "*$1*" ${@:2} }
function r() { grep "$1" ${@:2} -R . }

# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Cd to git root
function cd_root() { cd $(git rev-parse --show-toplevel) }

# Change dates
function change_date() {
  files=(~/Downloads/photos/dated/*)
  i=0
  while read x; do
    time=$x"0000"
    touch -t $time $files[$i]
    i=$i+1
  done
}

# Create subjects for the semester
function create_subjects() {
  files=(Métodos_Numéricos Sistemas_Operativos AMSS MC Álgebra_Lineal Medios Redes)
  terms=(1_Parcial 2_Parcial Final)
  for file in ${files[@]}; do
    mkdir $file
    cd $file
    for term in ${terms[@]}; do
      mkdir $term
    done
    cd ..
  done
}

# Update dotfiles
function upDotfiles() {
  last_path=pwd
  cd ~/Dotfiles
  echo doing brew bundle
  brew bundle dump --force
  echo pusing to git
  git add .
  git commit -m "Update dotfiles"
  git push -u origin master
  cd $last_path
}

