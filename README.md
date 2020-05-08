# Dotfiles
This is the setup is use for my dotfiles, it cover a wide range of configuration, but mainly is `brew/cask packages`, `zsh` and `vim`.

## Pre-installing
1. Install git: `$ xcode-select --install`
2. Clone the repo: `$ git clone https://github.com/ricglz0201/Dotfiles.git`

## Installation

Run: `./install.sh`

## What it will do?
1. Install brew if you haven't installed it yet.
2. Install essential brew packages
3. Install `oh-my-zsh`
4. Set up symlinks of dotfiles, this is done with [sl-setup.sh](./sl-setup.sh)
5. Create folders and files that are missing and are required
6. Install npm global packages using [npm-g-installs.sh](./npm-g-installs.sh)
7. Configure osx using [osx.sh](./osx.sh)
8. Setup for latex and pandoc, installing with brew and running [tlmgr_configuration.zsh](./tlmgr_configuration.zsh)
9. Source zshrc file
