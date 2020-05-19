" vim:fdm=marker

" Settings
setlocal shiftwidth=4
setlocal wrap
setlocal linebreak
setlocal nocursorcolumn
setlocal nocursorline
setlocal spell
setlocal spelllang=en_us,es_mx

" surround.vim {{{
let b:surround_42 = "**\r**"
let b:surround_95 = "_\r_"
" }}}

" EasyAlign
vmap <Leader>i :EasyAlign*<Bar><Enter>

" Markdown specific
let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
