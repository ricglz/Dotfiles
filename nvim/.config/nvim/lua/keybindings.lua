vim.g.mapleader = ','

require('nest').applyKeymaps {
  {'<C-h>', '<C-w>h'},
  {'<C-j>', '<C-w>j'},
  {'<C-k>', '<C-w>k'},
  {'<C-l>', '<C-w>l'},
  {'<Tab>', '<cmd>bnext<CR>'},
  {'<S-Tab>', '<cmd>bprevious<CR>'},
  {'<C-p>', '<cmd>Telescope git_files<CR>'},
  {'<C-a>', '<cmd>Telescope live_grep<CR>'},
  {'Y', 'y$'},
  {'J', 'mjJ`j'},
  {'space', ":exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>"},
  {'-', '@@'},

  {'<leader>', {
    {'*', ":%s/\\<<C-r><C-w>\\>//g<Left><Left>"},
    {'*', "hy:%s/\\V<C-r>h//g<Left><Left>", mode='v'},
  }},

  {mode='v', {
    {'<', '<gv'},
    {'>', '>gv'},
  }},
}
