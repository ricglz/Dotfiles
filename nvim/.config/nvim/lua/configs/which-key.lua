local wk = require("which-key")
wk.setup()
wk.register({
  ['*'] = {
    ':%s/\\<<C-r><C-w>\\>//g<Left><Left>',
    'Subtitutes all instances of word in buffer'
  },
  d = 'Go to definition',
  r = 'Rename symbol',
}, { prefix = '<leader>'})

wk.register({
  ['*'] = {
    'hy:%s/\\V<C-r>h//g<Left><Left>',
    'Subtitutes all instances of selection in buffer',
  },
}, { prefix = 'leader', mode = 'v'})
