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

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Setting up symlinks"
./sl-setup.sh

echo "Making directories"
if [! -d "~/.npm-packages"]; then
  mkdir "~/.npm-packages"
fi

if [! -d "~/Screenshots"]; then
  mkdir "~/Screenshots"
fi

echo "Adding extra folders for .vim"
if [! -d "~/.vim/plugged/"]; then
  mkdir "~/.vim/plugged/"
fi

if [! -d "~/.vim/undo/"]; then
  mkdir "~/.vim/undo/"
fi

echo "Creating the extra.zsh file in case it doesn't exist"
touch ~/extra.zsh

ask_for_confirmation "You want to install powerline?"
if answer_is_yes; then
  echo "Installing poweline"
  if [! -d "$ZSH_CUSTOM/themes/powerlevel10k"]; then
    git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k
  fi
fi

ask_for_confirmation "You want to install brew packages?"
if answer_is_yes; then
  echo "Doing brew bundle..."
  brew bundle
fi

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

echo "Finished installation"
source ~/.zshrc
