# ---- Aliases ----
alias cat='bat'
alias cl='clear'
alias components-lines='git ls-files src | grep -E "(tsx|jsx)$" | xargs wc -l | sort'
alias e='exit'
alias ex='exit'
alias java8='/usr/local/opt/openjdk@8/bin/java'
alias jpn='jupyter notebook'
alias python='python3'
alias pip='/usr/local/bin/pip3.10'
alias vim='nvim'
alias yta='yt-dlp -x --audio-format "mp3"'

# --- Functions ---
# Create a folder and move into it in one command
function mkcd() { mkdir -p "$@" && cd "$_"; }

# Cd to git root
function cd_root() { cd $(git rev-parse --show-toplevel) }

# ffmpeg a folder to create a video
function folder_to_video() { ffmpeg -framerate 24 -i "$1/%08d.jpg" $1.mp4 }
