augroup mappings_config
  autocmd!
  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Buffer navigation {{{
  nnoremap <leader>p :bp<CR>
  nnoremap <leader>n :bn<CR>
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  nnoremap <C-j> <C-W>j
  nnoremap <C-k> <C-W>k
  nnoremap <C-h> <C-W>h
  nnoremap <C-l> <C-W>l
  " }}}

  " Remap for uppercase typos {{{
  command! X x
  command! W write
  command! Q quit
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//g<Left><Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//g<left>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Maps to repeat macro {{{
  nnoremap - @@
  " }}}
augroup END
