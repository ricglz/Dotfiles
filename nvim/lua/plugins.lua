local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
  execute 'packadd packer.nvim'
end

local use = require('packer').use
local packer = require('packer').startup(function()
  -- Packer
  use 'wbthomason/packer.nvim'

  -- lsp
  use 'neovim/nvim-lspconfig'
  use 'kabouzeid/nvim-lspinstall'
  use 'hrsh7th/nvim-compe'

  -- Non-lua plugins
  use 'tpope/vim-surround'

  -- treesitter
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    requires = {
      {'nvim-treesitter/nvim-treesitter'}
    }
  }

  -- Snippets
  use {
    'hrsh7th/vim-vsnip',
    requires = {
      {'hrsh7th/vim-vsnip-integ'},
      {'rafamadriz/friendly-snippets'},
    }
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
    }
  }

  -- (Status/Tab)line
  use {
    'romgrk/barbar.nvim',
    requires = {'kyazdani42/nvim-web-devicons'}
  }
  use 'hoob3rt/lualine.nvim'

  -- Comments / Todos
  use 'terrortylor/nvim-comment'
  use 'folke/todo-comments.nvim'

  -- mkdir
  use {
    'jghauser/mkdir.nvim',
    config = function()
      require('mkdir')
    end
  }

  -- Editing supports
  use 'monaqa/dial.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'

  -- Others
  use 'marko-cerovac/material.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'Pocco81/TrueZen.nvim'
end)

require 'plugins-config/lualine'
require 'plugins-config/nvim-autopairs'
require 'plugins-config/nvim-compe'

return packer
