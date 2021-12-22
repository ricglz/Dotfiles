local enabled = { enable = true }
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  indent = enabled,
  highlight = enabled,
  autotag = enabled,
}
