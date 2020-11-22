" vim:fdm=marker

let b:ale_disable_lsp = 0
let b:ale_fixers = ['eslint'] + g:ale_fixers['*']
let b:ale_linters = ['eslint', 'flow', 'flow-language-server']
