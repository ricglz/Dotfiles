local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'LionC/nest.nvim'

  -- Visual plugins
  use {'norcalli/nvim-colorizer.lua', config="require'configs/nvim-colorizer'", ft={'css', 'html'}}
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require'configs/nvim-bufferline'",
    event = 'BufWinEnter'
  }
  use 'eddyekofo94/gruvbox-flat.nvim'
  use {
    'hoob3rt/lualine.nvim',
    config = "require'configs/lualine'",
    event = 'BufWinEnter',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufWinEnter',
    run = ':TSUpdate',
    config = "require'configs/nvim-treesitter'"
  }
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}

  -- LSP and Autocomplete
  use {'neovim/nvim-lspconfig', event = 'BufRead'}
  use {
    'hrsh7th/nvim-cmp',
    config = "require'configs/nvim-cmp'"
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
  use {'hrsh7th/vim-vsnip', after = "nvim-cmp"}
  use {'windwp/nvim-autopairs', after = 'nvim-cmp', config = "require'configs/nvim-autopairs'"}

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    cmd = "Telescope",
    config = "require'configs/telescope'"
  }

  -- Other
  use {'terrortylor/nvim-comment', config = "require('nvim_comment').setup()"}
  use {'blackCauldron7/surround.nvim', config = "require('surround').setup({mappings_style = 'surround'})"}
  use {'christoomey/vim-sort-motion'} -- TODO: Keep looking if there comes out a lua version
end)
