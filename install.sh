answer_is_yes() {
  [[ "$REPLY" =~ ^[Yy]$ ]] \
    && return 0 \
    || return 1
  }

ask_for_confirmation() {
  print_question "$1 (y/n) "
  read -n 1
  printf "\n"
}

print_question() {
  # Print output in yellow
  printf "\e[0;33m  [?] $1\e[0m"
}

which -s brew
if [[ $? != 0 ]] ; then
  echo "Installing homebrew"
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "Updating homebrew"
  brew update
fi

echo "Installing basic brew packages"
brew install bat ffmpeg fzf gcc git joplin node python ruby vim yarn youtube-dl
brew cask install flux font-source-code-pro google-chrome iterm2

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Setting up symlinks"
./sl-setup.sh

echo "Making folders"
DIRECTORIES=('.npm-packages', 'Screenshots', '.vim/plugged', '.vim/undo', '.vim/swaps')
for dir in DIRECTORIES; do
  dir_path="$HOME/$dir"
  if [! -d $dir_path]; then
    echo "Creating folder: $dir_path"
    mkdir $dir_path
  fi
done

echo "Creating the extra.zsh file in case it doesn't exist"
touch ~/extra.zsh

ask_for_confirmation "You want to install npm packages?"
if answer_is_yes; then
  echo "Installing npm global packages"
  ./npm-g-installs.sh
fi

ask_for_confirmation "You want to setup osx configuration?"
if answer_is_yes; then
  echo "Setting up configuration for osx"
  ./osx.sh
fi

ask_for_confirmation "You want to setup latex and pandoc?"
if answer_is_yes; then
  echo "Setting up latex and pandoc"
  brew install pandoc pandoc-citeproc
  brew cask install basictex
  ./tlmgr_configuration.zsh
fi

echo "Finished installation"
source ~/.zshrc
