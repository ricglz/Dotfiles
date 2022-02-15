local enabled = { enable = true }
require'nvim-treesitter.configs'.setup {
  ensure_installed = 'maintained',
  indent = enabled,
  highlight = enabled,
  autotag = enabled,
  matchup = enabled,
  refactor = {
    smart_rename = {
      enable = true,
      keymaps = { smart_rename = "<leader>r" }
    },
    navigation = {
      enable = true,
      keymaps = {
        goto_definition = "<leader>d",
      }
    }
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      keymaps = {
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
        ["al"] = "@loop.outer",
        ["il"] = "@loop.inner",
        ["ai"] = "@conditional.outer",
        ["ii"] = "@conditional.inner",
      },
    },
  },
}