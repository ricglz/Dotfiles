" vim:fdm=marker

" Settings {{{
setlocal linebreak
setlocal nocursorcolumn
setlocal nocursorline
setlocal shiftwidth=4
setlocal spell
setlocal spelllang=en_us,es_mx
setlocal wrap
" }}}

" Mappings for easy navigation due wrap {{{
nmap <buffer>0 g0
nmap <buffer>$ g$
" }}}

" surround.vim {{{
let b:surround_42 = "**\r**"
" }}}

" Markdown specific
let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
