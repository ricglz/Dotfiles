" General VIM Configuration

let mapleader=","
syntax on
colorscheme evolution

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

" Plugins

" Load plugins {{{
call plug#begin('~/.vim/plugged')

" General plugins
Plug '/usr/local/opt/fzf'
Plug 'christoomey/vim-sort-motion'
Plug 'coderifous/textobj-word-column.vim'
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim', {'on': ['GFiles', 'Files', 'Rg']}
Plug 'junegunn/vim-easy-align'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'lucapette/vim-textobj-underscore'
Plug 'pbrisbin/vim-mkdir'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'

" Javascript/React plugins
Plug 'HerringtonDarkholme/yats.vim', {'for': ['typescript', 'typescriptreact']}
Plug 'MaxMEllon/vim-jsx-pretty', {'for': 'react'}
Plug 'yuezk/vim-js', {'for': 'javascript'}

" Others
Plug 'bps/vim-textobj-python', {'for': 'python'}
Plug 'ekalinin/Dockerfile.vim', {'for': ['Dockerfile', 'docker-compose']}
Plug 'junegunn/goyo.vim', {'for': 'markdown'}
Plug 'lervag/vimtex', {'for': 'tex'}
Plug 'othree/html5.vim', {'for': 'html'}
Plug 'tpope/vim-markdown', {'for': 'markdown'}

call plug#end()
" }}}
