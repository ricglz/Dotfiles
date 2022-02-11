local null_ls = require("null-ls")
null_ls.setup({
  sources = {
    -- JS yaml html markdown
    null_ls.builtins.formatting.prettier,
    -- Spell checking
    null_ls.builtins.diagnostics.codespell.with({
      args = { "--builtin", "clear,rare,code", "-" },
    }),
  },
  on_attach = function()
    vim.cmd([[ command! Format execute 'lua vim.lsp.buf.formatting()' ]])
  end,
})
