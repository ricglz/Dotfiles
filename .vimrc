" General VIM Configuration

" Load plugins {{{
call plug#begin('~/.vim/plugged')

" Fzf
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim', {'on': ['GFiles', 'Files', 'Rg']}

" ALE (Static analysis)
Plug 'dense-analysis/ale'

" New vim-ish commands
Plug 'christoomey/vim-sort-motion'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" New text objects
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'bps/vim-textobj-python', {'for': 'python'}

" Snippets
Plug 'SirVer/ultisnips'

" Filetypes specific plugins
Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescriptreact']}
Plug 'MaxMEllon/vim-jsx-pretty', {'for': 'react'}
Plug 'yuezk/vim-js', {'for': 'javascript'}
Plug 'ekalinin/Dockerfile.vim', {'for': ['Dockerfile', 'docker-compose']}
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}

" Others
Plug 'pbrisbin/vim-mkdir'
Plug 'jiangmiao/auto-pairs'
call plug#end()
" }}}

let mapleader=","
syntax on
colorscheme gruvbox
let g:python3_host_prog = '/usr/local/bin/python3.8'

" Plugin Configuration

" Ale.vim {{{
augroup ale_config
  autocmd!
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚠'
  let g:ale_fixers = {'*': ['remove_trailing_lines', 'trim_whitespace']}
  let g:ale_fix_on_save = 1
augroup END
" }}}

" EasyAlign {{{
augroup easy_align_config
  nmap ga <Plug>(EasyAlign)
augroup END
" }}}

" fzf.vim {{{
augroup fzf_config
  autocmd!
  silent! !git rev-parse --is-inside-work-tree
  if v:shell_error == 0
    map <C-p> :GFiles --cached --others --exclude-standard<CR>
    map <C-o> :GFiles?<CR>
  else
    map <C-p> :Files<CR>
  endif
  map <C-a> :Rg<CR>
augroup END
" }}}

" UltiSnips.vim {{{
augroup ultisnips_config
  nmap <leader>s :UltiSnipsEdit<cr>
  let g:UltiSnipsEditSplit="vertical"
augroup END
"}}}

" vim-sort-motion {{{
augroup sort_motion_config
  let g:sort_motion_flags = "ui"
augroup END
"}}}

" vimtex {{{
augroup vimtex_config
  let g:vimtex_compiler_method = 'tectonic'
augroup END
"}}}
