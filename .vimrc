" vim:fdm=marker

" General VIM Configuration

" Mapleader {{{
let mapleader=","
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
colorscheme evolution
" }}}

" Local directories {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" }}}

" (Set)tings {{{
augroup sets_config
  autocmd!
  set autoindent " Copy indent from last line when starting new line
  set backspace=indent,eol,start " Make backspace expected behavior in insert mode
  set clipboard=unnamed " Share clipboard with the system
  set cursorcolumn " Highlight current column
  set cursorline " Highlight current line
  set expandtab " Expand tabs to spaces
  set foldcolumn=0 " Column to show folds
  set foldenable " Enable folding
  set foldlevel=0 " Close all folds by default
  set foldmethod=syntax " Syntax are used to specify folds
  set foldminlines=0 " Allow folding single lines
  set foldnestmax=5 " Set max fold nesting level
  set formatoptions+=1 " Break before 1-letter words
  set formatoptions+=2 " Use indent from 2nd line of a paragraph
  set formatoptions+=c " Format comments
  set formatoptions+=l " Don't break lines that are already long
  set formatoptions+=n " Recognize numbered lists
  set formatoptions+=r " Continue comments by default
  set hidden " When a buffer is brought to foreground, remember undo history and marks
  set hlsearch " Highlight searches
  set ignorecase " Ignore case of searches
  set incsearch " Highlight dynamically as pattern is typed
  set laststatus=2 " Always show status line
  set lazyredraw " Don't redraw when we don't have to
  set magic " Enable extended regexes
  set noerrorbells " Disable error bells
  set noshowmode " Don't show the current mode (airline.vim takes care of us)
  set nostartofline " Don't reset cursor to start of line when moving around
  set nowrap " Do not wrap lines
  set number " Set current number line
  set ofu=syntaxcomplete#Complete " Set omni-completion method
  set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
  set relativenumber " Set relative numbers line
  set report=0 " Show all changes
  set ruler " Show the cursor position
  set shell=/bin/zsh " Use /bin/sh for executing shell commands
  set shiftwidth=2 " The # of spaces for indenting
  set shortmess=atI " Don't show the intro message when starting vim
  set showtabline=2 " Always show tab bar
  set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
  set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
  set softtabstop=2 " Tab key results in 2 spaces
  set splitbelow " New window goes below
  set splitright " New windows goes right
  set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
  set title " Show the filename in the window titlebar
  set ttyfast " Send more characters at a given time
  set ttymouse=xterm " Set mouse type to xterm
  set undofile " Persistent Undo
  set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
  set visualbell " Use visual bell instead of audible bell (annnnnoying)
  set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
  set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
  set wildignore+=*/bower_components/*,*/node_modules/*
  set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
  set wildignore+=.DS_Store
  set wildmenu " Hitting TAB in command mode will show possible completions above command line
  set wildmode=list:longest " Complete only until point of ambiguity
  set winminheight=0 " Allow splits to be reduced to a single line
  set wrapscan " Searches wrap around end of file
augroup END
" }}}

" FastEscape {{{
" Speed up transition from modes
if ! has('gui_running')
  set ttimeoutlen=10
  augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
  augroup END
endif
" }}}

" Mappings {{{
augroup mappings_config
  autocmd!
  " Remove search highlight {{{
  nnoremap <Leader><space> :noh<cr>
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Buffer navigation {{{
  nnoremap <leader>p :bp<CR>
  nnoremap <leader>n :bn<CR>
  " }}}

  " Better split switching (Ctrl-j, Ctrl-k, Ctrl-h, Ctrl-l) {{{
  map <C-j> <C-W>j
  map <C-k> <C-W>k
  map <C-H> <C-W>h
  map <C-L> <C-W>l
  " }}}

  " Remap :W to :w {{{
  command! W write
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//g<Left><Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Set configuration for increment number {{{
  nnoremap <C-i> <C-a>
  " }}}
augroup END
"}}}

" Plugin Configuration

" Ale.vim {{{
augroup ale_config
  autocmd!
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚠'

  let g:ale_completion_enabled = 1
  let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \}
  let g:ale_fix_on_save = 1
augroup END
" }}}

" Airline.vim {{{
augroup airline_config
  autocmd!
  let g:airline_powerline_fonts = 1
  let g:airline_enable_syntastic = 1
  let g:airline#extensions#tabline#buffer_nr_format = '%s '
  let g:airline#extensions#tabline#buffer_nr_show = 1
  let g:airline#extensions#tabline#enabled = 1
  let g:airline#extensions#tabline#fnamecollapse = 0
  let g:airline#extensions#tabline#fnamemod = ':t'
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

" NERD Commenter {{{
augroup nerd_commenter_config
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
augroup END
" }}}

" UltiSnips.vim {{{
nmap <leader>s :UltiSnipsEdit<cr>
let g:UltiSnipsSnippetDirectories=["~/.vim/my_snippets"]
let g:UltiSnipsEditSplit="vertical"
"}}}

" Plugins

" Load plugins {{{
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'dense-analysis/ale'
Plug 'ekalinin/Dockerfile.vim', {'for': 'Dockerfile'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim', {'on': ['GFiles', 'Files', 'Rg']}
Plug 'junegunn/vim-easy-align', {'for': 'markdown', 'on': 'EasyAlign'}
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'lucapette/vim-textobj-underscore'
Plug 'maxmellon/vim-jsx-pretty', {'for': ['js', 'jsx']}
Plug 'mrk21/yaml-vim', {'for': 'yaml'}
Plug 'onemanstartup/vim-slim', {'for': 'slim'}
Plug 'pangloss/vim-javascript', {'for': 'javascript'}
Plug 'pechorin/any-jump.vim', {'for': ['ruby', 'slim']}
Plug 'peitalin/vim-jsx-typescript', {'for': 'typescript'}
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-markdown', {'for': 'markdown'}
Plug 'tpope/vim-rails', {'for': 'ruby'}
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-ruby/vim-ruby', {'for': 'ruby'}
Plug 'wlangstroth/vim-racket', {'for': 'racket'}
Plug 'xolox/vim-misc'
Plug 'yuezk/vim-js', {'for': 'js'}

call plug#end()
" }}}
