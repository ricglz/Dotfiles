# Dotfiles
This is the setup is use for my dotfiles, it cover a wide range of configuration, but mainly is `brew/cask packages`, `zsh` and `vim`.

## Pre-installing
1. Install git: `$ xcode-select --install`
2. Clone the repo: `$ git clone https://github.com/ricglz0201/Dotfiles.git`

## Installation

Run: `./install.sh`

What it will do is the next in the exact order
1. Install brew if you don't have it installed
2. Install brew packages using `brew bundle`, which is a default command of brew that reads the content of the `Brewfile` and install the packages.
3. Make `.npm-packages`, this will be a folder to store global npm packages
4. Set up symlinks of dotfiles, this is done in the script of [sl-setup.sh](./sl-setup.sh)
5. Install [powerline10k](https://github.com/romkatv/powerlevel10k)
6. Add extra folders for vim (`.vim/plugged` and `.vim/undo`)
7. Install npm global packages using [npm-g-installs.sh](./npm-g-installs.sh)
8. Configure osx using [osx.sh](./osx.sh)
9. Source zshrc file
