" vim:fdm=marker

" Settings
setlocal shiftwidth=4

" surround.vim {{{
let b:surround_42 = "**\r**"
let b:surround_95 = "_\r_"
let b:surround_241 = "¡\r!"
let b:surround_241 = "¡\r!"
" }}}

" EasyAlign
vmap <Leader>i :EasyAlign*<Bar><Enter>

" Markdown specific
let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
