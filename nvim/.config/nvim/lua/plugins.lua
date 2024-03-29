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

  local use_after = function(plugin, opts)
    opts['after'] = plugin
    use(opts)
  end

  use 'wbthomason/packer.nvim'

  -- Performance/Fix
  use 'antoinemadec/FixCursorHold.nvim'
  use 'nathom/filetype.nvim'

  -- Keybinding
  use {'LionC/nest.nvim', config = lua_path('nest')}
  use {
    'folke/which-key.nvim',
    config = lua_path('which-key'),
    event = 'BufWinEnter',
  }

  -- Visual
  use {
    'norcalli/nvim-colorizer.lua',
    config = lua_path('nvim-colorizer'),
    ft={'css', 'html'},
  }
  use {
    'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = lua_path('nvim-bufferline'),
  }
  use 'eddyekofo94/gruvbox-flat.nvim'
  use {
    'hoob3rt/lualine.nvim',
    config = lua_path('lualine'),
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
  }

  -- Treesitter
  local use_after_ts = function(opts) use_after('nvim-treesitter', opts) end

  use {
    'nvim-treesitter/nvim-treesitter',
    event = 'BufWinEnter',
    run = ':TSUpdate',
    config = lua_path('nvim-treesitter'),
  }
  use_after_ts {
    'windwp/nvim-ts-autotag',
    ft = {'typescript', 'typescriptreact'},
  }
  use_after_ts { 'andymass/vim-matchup' }
  use_after_ts { 'numToStr/Comment.nvim', config = lua_path('nvim-comment') }
  use_after_ts { 'nvim-treesitter/nvim-treesitter-textobjects' }

  -- LSP and Autocomplete
  use {
    'neovim/nvim-lspconfig',
    requires='hrsh7th/cmp-nvim-lsp',
    config = 'require"lsp"'
  }

  local use_after_cmp = function(opts) use_after('nvim-cmp', opts) end
  use {
    'hrsh7th/nvim-cmp',
    config = lua_path('nvim-cmp'),
    event = 'InsertEnter',
  }

  use_after_cmp { 'hrsh7th/cmp-buffer' }
  use_after_cmp { 'windwp/nvim-autopairs', config = lua_path('nvim-autopairs') }
  use_after_cmp {
    'saadparwaiz1/cmp_luasnip',
    config = lua_path('lua-snip'),
    requires='L3MON4D3/LuaSnip'
  }

  -- Formatting
  use {
    'jose-elias-alvarez/null-ls.nvim',
    requires = { 'neovim/nvim-lspconfig', 'nvim-lua/plenary.nvim' },
    config = lua_path('null-ls'),
    event = 'BufWritePre',
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'LionC/nest.nvim',
      {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
    },
    config = lua_path('telescope')
  }

  -- Terminal
  use { 'numToStr/FTerm.nvim', cmd = {'Git', 'Term'}, config = lua_path('fterm') }

  -- Testing
  use {
    'klen/nvim-test',
    cmd = { 'TestNearest', 'TestFile', 'TestSuite', 'TestLast' },
    config = lua_path('nvim-test')
  }

  -- Syntax
  use { 'ekalinin/Dockerfile.vim', ft='dockerfile' }

  -- Vim-like plugins
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'christoomey/vim-sort-motion' -- TODO: Keep looking if there comes out a lua version
  use { 'junegunn/vim-easy-align', config = lua_path('vim-easy-align') }

  -- Other
  use { 'dstein64/vim-startuptime', cmd = 'StartupTime' }
  use { 'jghauser/mkdir.nvim', event = 'BufWritePre', config = "require'mkdir'" }
  use { 'famiu/bufdelete.nvim', cmd = 'Bdelete' }
end)
