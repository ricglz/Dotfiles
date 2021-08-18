local map = vim.api.nvim_set_keymap
local opts = { noremap = true }
local silent_opts = { noremap = true, silent = true }
local silent_expr_opts = { noremap = true, silent = true, expr = true }

-- Yank from cursor to end of line
map('n', 'Y', 'y$', opts)

-- Buffer navigation (,p ,n)
map('n', '<leader>p', ':bp<CR>', opts)
map('n', '<leader>n', ':bn<CR>', opts)

-- Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l)
map('n', '<C-j>', '<C-W>j', opts)
map('n', '<C-k>', '<C-W>k', opts)
map('n', '<C-h>', '<C-W>h', opts)
map('n', '<C-l>', '<C-W>l', opts)

-- Search and replace word under cursor (,*)
map('n', '<leader>*', ':%s/\\<<C-r><C-w>\\>//g<Left><Left>', opts)
map('v', '<leader>*', '"hy:%s/\\V<C-r>h//g<left>', opts)

-- Join lines and restore cursor location (J)
map('n', 'J', 'mjJ`j', opts)

-- Toggle folds (<Space>)
map('n', '<space>', ":exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>", silent_opts)

-- Repeat macro (-)
map('n', '-', '@@', opts)

-- Compe mappings
map('i', '<C-Space> ', 'compe#complete()', silent_expr_opts)
map('i', '<CR> ', "compe#confirm('<CR>')", silent_expr_opts)
map('i', '<C-e> ', "compe#close('<C-e>')", silent_expr_opts)
map('i', '<C-f> ', "compe#scroll({ 'delta': +4 })", silent_expr_opts)
map('i', '<C-d> ', "compe#scroll({ 'delta': +4 })", silent_expr_opts)
