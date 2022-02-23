local null_ls = require('null-ls')
local on_attach = require('lsp.on_attach')

local sources = {
  null_ls.builtins.formatting.json_tool,
  null_ls.builtins.formatting.prettierd,
  null_ls.builtins.formatting.eslint_d,
  null_ls.builtins.formatting.stylelint,
  null_ls.builtins.formatting.trim_newlines,
  null_ls.builtins.formatting.trim_whitespace,
}

null_ls.setup {sources = sources, on_attach = on_attach}
