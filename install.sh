# Install brew
echo "Installing brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Doing brew bundle..."
brew bundle

echo "Setting up symlinks"
./sl-setup.sh
