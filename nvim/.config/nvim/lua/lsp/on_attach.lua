local add_command = vim.api.nvim_add_user_command

local no_lsp = function() return (#vim.lsp.buf_get_clients()) < 1 end

local format_document = function()
  if no_lsp() then
    return
  end

  vim.lsp.buf.formatting_sync(nil, 1500)
end

local is_javascript = function()
  local ft = vim.bo.filetype
  return ft == 'javascript' or ft == 'typescript' or
         ft == 'javascriptreact' or ft == 'typescriptreact'
end

local organize_imports = function()
  if not is_javascript() or no_lsp() then
    return
  end

  local params = {
    command = '_typescript.organizeImports',
    arguments = { vim.api.nvim_buf_get_name(0) },
    title = '',
  }
  vim.lsp.buf_request_sync(vim.api.nvim_get_current_buf(), 'workspace/executeCommand', params, 1500)
end

local add_command_path = function()
  add_command('Format', format_document, { desc = 'Format the document' })
  if is_javascript() then
    add_command('OrganizeImports', organize_imports, { desc = 'Organize imports via tsserver' })
  end
  vim.cmd([[
    augroup fmt
      autocmd BufWritePre * Format
    augroup END
  ]])
end

local other_path = function()
  vim.cmd([[
    augroup fmt
      autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()
    augroup END
  ]])
end

local format = function(client)
  if client.name ~= 'null-ls' then
    client.resolved_capabilities.document_formatting = false
    return
  end

  if add_command == nil then
    other_path()
  else
    add_command_path()
  end
end

local on_attach = function(client)
  vim.cmd('autocmd CursorHold * lua vim.diagnostic.open_float(nil, {focus=false, scope="cursor", border="rounded"})')
  format(client)
end

return on_attach
