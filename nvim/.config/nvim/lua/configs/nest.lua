require('nest').applyKeymaps {
  {'<C-h>', '<C-w>h'},
  {'<C-j>', '<C-w>j'},
  {'<C-k>', '<C-w>k'},
  {'<C-l>', '<C-w>l'},
  {'<Tab>', '<cmd>bnext<CR>'},
  {'<S-Tab>', '<cmd>bprevious<CR>'},
  {'<C-p>', '<cmd>Telescope git_files<CR>'},
  {'<C-a>', '<cmd>Telescope live_grep<CR>'},
  {'J', 'mjJ`j'},
  {'<space>', 'za'},
  {'-', '@@'},
  {mode='v', {
    {'<', '<gv'},
    {'>', '>gv'},
  }},
}
