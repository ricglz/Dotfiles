local null_ls = require('null-ls')
local on_attach = require('lsp.on_attach')

print('This is in null-ls')

local sources = {
  null_ls.builtins.formatting.prettier,
}

null_ls.setup {sources = sources, on_attach = on_attach}
