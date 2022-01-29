local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', 'https://github.com/wbthomason/packer.nvim', install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup(function()
  local lua_path = function(pkg)
    return string.format("require'configs.%s'", pkg)
  end

  use 'wbthomason/packer.nvim'

  -- Performance/Fix
  use 'antoinemadec/FixCursorHold.nvim'
  use 'nathom/filetype.nvim'

  -- Keybinding
  use {'LionC/nest.nvim', config = lua_path('nest')}
  use {'folke/which-key.nvim', config = lua_path('which-key')}

  -- Visual
  use {'norcalli/nvim-colorizer.lua', config = lua_path('nvim-colorizer'), ft={'css', 'html'}}
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = lua_path('nvim-bufferline'),
    event = 'BufWinEnter'
  }
  use 'eddyekofo94/gruvbox-flat.nvim'
  use {
    'hoob3rt/lualine.nvim',
    config = lua_path('lualine'),
    event = 'BufWinEnter',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufWinEnter',
    run = ':TSUpdate',
    config = lua_path('nvim-treesitter')
  }
  use {'windwp/nvim-ts-autotag', after = 'nvim-treesitter'}
  use {'andymass/vim-matchup', after = 'nvim-treesitter'}
  use {
    'numToStr/Comment.nvim',
    after = 'nvim-treesitter',
    config = lua_path('nvim-comment')
  }
  use {
    'nvim-treesitter/nvim-treesitter-refactor',
    after = 'nvim-treesitter'
  }
  use {
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter'
  }

  -- LSP and Autocomplete
  use {
    'hrsh7th/nvim-cmp',
    config = lua_path('nvim-cmp'),
    event = 'BufWinEnter',
  }
  use {
    'hrsh7th/cmp-nvim-lsp',
    requires = {'neovim/nvim-lspconfig'},
  }
  use {'hrsh7th/cmp-buffer', after = 'nvim-cmp'}
  use {'hrsh7th/vim-vsnip', requires = "nvim-cmp"}
  use {
    'windwp/nvim-autopairs',
    after = 'nvim-cmp',
    config = lua_path('nvim-autopairs')
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
    config = lua_path('telescope')
  }

  -- Other
  -- This one sucked, will see if I can contribute to improve it, but for know
  -- it is crap
  -- use {'blackCauldron7/surround.nvim', config = lua_path('surround')}
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'christoomey/vim-sort-motion' -- TODO: Keep looking if there comes out a lua version
  use 'dstein64/vim-startuptime'
end)
