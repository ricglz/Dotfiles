# ---- Aliases ----
alias cat='bat'
alias cl='clear'
alias e='exit'
alias ex='exit'
alias jpn='jupyter notebook'
alias vim='nvim'
alias yta='youtube-dl -x --audio-format "mp3"'
alias java8='/usr/local/opt/openjdk@8/bin/java'

# --- Functions ---
# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Cd to git root
function cd_root() { cd $(git rev-parse --show-toplevel) }

# ffmpeg a folder to create a video
function folder_to_video() { ffmpeg -framerate 24 -i "$1/%08d.jpg" $1.mp4 }
