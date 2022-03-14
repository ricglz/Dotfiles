local wk = require("which-key")
wk.setup()

wk.register({
  ['*'] = {
    ':%s/\\<<C-r><C-w>\\>//g<Left><Left>',
    'Subtitutes all instances of word in buffer'
  },
  c = 'Perform code action',
  D = 'See type definition',
  r = 'Rename symbol',
}, { prefix = '<leader>'})

wk.register({
  b = 'Comment block',
  c = 'Comment line',
  d = 'Go to definition',
  D = 'Go to declaration',
  r = 'See references',
  s = 'Sort',
}, { prefix = 'g'})

wk.register({
  ['*'] = {
    'hy:%s/\\V<C-r>h//g<Left><Left>',
    'Subtitutes all instances of selection in buffer',
  },
}, { prefix = 'leader', mode = 'v'})
