local nvim_lsp = require('lspconfig')
local cmp_nvim_lsp = require('cmp_nvim_lsp')
local capabilities = cmp_nvim_lsp.update_capabilities(vim.lsp.protocol.make_client_capabilities())
local on_attach = require('lsp.on_attach')

local servers = {
  'cssls',
  'eslint',
  'html',
  'jsonls',
  'rust_analyzer',
  'tsserver',
  'ccls',
  'pyright',
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach,
  }
end
