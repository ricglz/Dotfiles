# Dotfiles

This is the setup is use for my dotfiles, it cover a wide range of configuration, being these:

* Brew packages
* ZSH plugins and prompt
* VIM configuration (Neovim)
* Pandoc/Latex
* NPM/Yarn packages
* Aliases, functions and others for shell

## Pre-installing

1. Install git: `$ xcode-select --install`
2. Clone the repo: `$ git clone https://github.com/ricglz0201/Dotfiles.git`

## Installation

Run: `./install.sh`

## What it will do?

1. Install or update brew depending of the case
2. Install essential brew packages (antibody being one of them)
3. Setup the symlinks for the dotfiles located inside the folder
4. Setup configuration for kitty terminal
5. Setup configuration for Neovim
6. Make necessary folders and files for a correct functionality
7. Optional installation of certain npm/yarn global packages
8. Optional OSX configuration
9. Optional latex and pandoc configuration
10. Sourcing the `.zshrc` file to trigger the changes
