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
  use {'norcalli/nvim-colorizer.lua', config="require'config/nvim-colorizer'", ft={'css', 'html'}}
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = "require'config/nvim-bufferline'",
    event = 'BufWinEnter'
  }
  use 'eddyekofo94/gruvbox-flat.nvim'
  use {
    'hoob3rt/lualine.nvim',
    config = "require'config/lualine'",
    event = 'BufWinEnter',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufWinEnter',
    run = ':TSUpdate',
    config = "require'config/nvim-treesitter'"
  }
  use {'windwp/nvim-ts-autotag', disable = not is_enabled('treesitter'), after = 'nvim-treesitter'}

  -- LSP and Autocomplete
  use {'neovim/nvim-lspconfig', event = 'BufRead'}
  use {
    'hrsh7th/nvim-cmp',
    config = "require'config/nvim-cmp'"
  }
  use 'hrsh7th/cmp-nvim-lsp'
  use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
  use {'hrsh7th/vim-vsnip', after = "nvim-cmp"}
  use {'windwp/nvim-autopairs', after = 'nvim-cmp', config = "require'config/nvim-autopairs'"}
end)
