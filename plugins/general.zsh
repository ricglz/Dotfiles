# ---- Aliases ----
alias cat='bat'
alias cl='clear'
alias e='exit'
alias ex='exit'
alias vim='nvim'

# --- Functions ---
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
  subjects=()
  ans="y"
  while [[ $ans =~ ^[Yy]$ ]]; do
    echo "Which subject do you want to add?"
    read new_subject
    subjects+=($new_subject)
    echo "Want to add another subject?"
    read ans
  done
  terms=(1_Parcial 2_Parcial Final)
  for subject in ${subjects[@]}; do
    mkcd $subject
    for term in ${terms[@]}; do
      mkdir $term
    done
    cd ..
  done
}

# youtube-dl
function add_music() {
  if [ ! -e "$HOME/Music/legal" ]; then
    mkdir "$HOME/Music/legal"
  fi
  cd $HOME/Music/legal
  metadata="([0-9]*\\. )?(?P<artist>.+?)(\\s*OST [0-9]*)?\\s*(-|\\|)"
  metadata="${metadata}\\s*(?P<title>.+)\\s*(.*Oficial.*)?\\s*"
  youtube-dl $1 -x --download-archive archive.txt \
    --yes-playlist --audio-format "mp3" \
    --add-metadata --embed-thumbnail \
    --metadata-from-title "${metadata}" \
    --ignore-errors \
    -o "%(title)s.%(ext)s"
  fd -E 'archive\.txt' -x open
  echo 'Waiting to open all the music files'
  sleep 100
  echo 'Hopefully all the music was open, then I will delete'
  fd -E 'archive\.txt' -x rm
  cd -
}
