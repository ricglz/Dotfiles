require('nest').applyKeymaps {
  {'<C-h>', '<C-w>h'},
  {'<C-j>', '<C-w>j'},
  {'<C-k>', '<C-w>k'},
  {'<C-l>', '<C-w>l'},
  {'<Tab>', '<cmd>bnext<CR>'},
  {'<S-Tab>', '<cmd>bprevious<CR>'},
  {'J', 'mjJ`j'},
  {'<space>', 'za'},
  {'-', '@@'},
  {'<leader>d', '<cmd>Bdelete<CR>'},
  {mode='v', {
    {'<', '<gv'},
    {'>', '>gv'},
  }},
}
