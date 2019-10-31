which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

echo "Doing brew bundle..."
brew bundle

echo "Installing oh-my-zsh"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Making directories"
mkdir ~/.npm-packages

echo "Setting up symlinks"
./sl-setup.sh

echo "Installing poweline"
git clone https://github.com/romkatv/powerlevel10k.git $ZSH_CUSTOM/themes/powerlevel10k

echo "Adding extra folders for .vim"
if [! -d "~/.vim/plugged/"]; then
  mkdir "~/.vim/plugged/"
fi

if [! -d "~/.vim/undo/"]; then
  mkdir "~/.vim/undo/"
fi

echo "Installing npm global packages"
./npm-g-installs.sh

echo "Setting up configuration for osx"
./osx.sh

echo "Finished installation"
source ~/.zshrc
