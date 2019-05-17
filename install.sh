# Install brew
echo "Installing/Updating brew..."
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

echo "Installing npm global packages"
./npm-g-installs.sh

echo "Finished installation"
source ~/.zshrc
