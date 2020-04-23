" vim:fdm=marker

" Settings -------------------------------------------------------------

" Preamble {{{
" Make vim more useful {{{
set nocompatible
" }}}

" Syntax highlighting {{{
set t_Co=256
set background=dark
syntax on
colorscheme molotov
" }}}

" Mapleader {{{
let mapleader=","
" }}}

" Mapping important stuff {{{
nnoremap <Leader><space> :noh<cr>
"}}}

" Local directories {{{
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
set undodir=~/.vim/undo
" }}}

" Set some junk {{{
set autoindent " Copy indent from last line when starting new line
set backspace=indent,eol,start
set clipboard=unnamed
set cursorcolumn " Highlight current column
set cursorline " Highlight current line
set diffopt=filler " Add vertical spaces to keep right and left aligned
set diffopt+=iwhite " Ignore whitespace changes (focus on code changes)
set encoding=utf-8 nobomb " BOM often causes trouble
set esckeys " Allow cursor keys in insert mode
set expandtab " Expand tabs to spaces
set foldcolumn=0 " Column to show folds
set foldenable " Enable folding
set foldlevel=0 " Close all folds by default
set foldmethod=syntax " Syntax are used to specify folds
set foldminlines=0 " Allow folding single lines
set foldnestmax=5 " Set max fold nesting level
set formatoptions+=c " Format comments
set formatoptions+=r " Continue comments by default
set formatoptions+=o " Make comment when using o or O from comment line
set formatoptions+=q " Format comments with gq
set formatoptions+=n " Recognize numbered lists
set formatoptions+=2 " Use indent from 2nd line of a paragraph
set formatoptions+=l " Don't break lines that are already long
set formatoptions+=1 " Break before 1-letter words
set hidden " When a buffer is brought to foreground, remember undo history and marks
set hlsearch " Highlight searches
set ignorecase " Ignore case of searches
set incsearch " Highlight dynamically as pattern is typed
set laststatus=2 " Always show status line
set lazyredraw " Don't redraw when we don't have to
set magic " Enable extended regexes
set mouse=a " Enable mouse in all modes
set noerrorbells " Disable error bells
set nojoinspaces " Only insert single space after a '.', '?' and '!' with a join command
set noshowmode " Don't show the current mode (airline.vim takes care of us)
set nostartofline " Don't reset cursor to start of line when moving around
set nowrap " Do not wrap lines
set rnu
set ofu=syntaxcomplete#Complete " Set omni-completion method
set regexpengine=1 " Use the old regular expression engine (it's faster for certain language syntaxes)
set report=0 " Show all changes
set ruler " Show the cursor position
set scrolloff=3 " Start scrolling three lines before horizontal border of window
set shell=/bin/sh " Use /bin/sh for executing shell commands
set shiftwidth=2 " The # of spaces for indenting
set shortmess=atI " Don't show the intro message when starting vim
set showtabline=2 " Always show tab bar
set sidescrolloff=3 " Start scrolling three columns before vertical border of window
set smartcase " Ignore 'ignorecase' if search patter contains uppercase characters
set smarttab " At start of line, <Tab> inserts shiftwidth spaces, <Bs> deletes shiftwidth spaces
set softtabstop=2 " Tab key results in 2 spaces
set splitbelow " New window goes below
set splitright " New windows goes right
set suffixes=.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll
set switchbuf=""
set title " Show the filename in the window titlebar
set ttyfast " Send more characters at a given time
set ttymouse=xterm " Set mouse type to xterm
set undofile " Persistent Undo
set viminfo=%,'9999,s512,n~/.vim/viminfo " Restore buffer list, marks are remembered for 9999 files, registers up to 512Kb are remembered
set visualbell " Use visual bell instead of audible bell (annnnnoying)
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildignore+=.DS_Store
set wildignore+=*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js
set wildignore+=*/bower_components/*,*/node_modules/*
set wildignore+=*/smarty/*,*/vendor/*,*/.git/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*,*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*
set wildmenu " Hitting TAB in command mode will show possible completions above command line
set wildmode=list:longest " Complete only until point of ambiguity
set winminheight=0 " Allow splits to be reduced to a single line
set wrapscan " Searches wrap around end of file
" }}}
" }}}

" Configuration -------------------------------------------------------------

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

" General {{{
augroup general_config
  autocmd!

  " Faster split resizing (+,-) {{{
  if bufwinnr(1)
    map + <C-W>+
    map - <C-W>-
  endif
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

  " Toggle show tabs and trailing spaces (,c) {{{
  set lcs=tab:›\ ,trail:·,eol:¬,nbsp:_
  set fcs=fold:-
  nnoremap <silent> <leader>c :set nolist!<CR>
  " }}}

  " Remap keys for auto-completion menu {{{
  inoremap <expr> <CR>   pumvisible() ? "\<C-y>" : "\<CR>"
  inoremap <expr> <Down> pumvisible() ? "\<C-n>" : "\<Down>"
  inoremap <expr> <Up>   pumvisible() ? "\<C-p>" : "\<Up>"
  " }}}

  " Yank from cursor to end of line {{{
  nnoremap Y y$
  " }}}

  " Move lines will in visual mode {{{
  vnoremap <leader>u :m-2<CR>gv=gv
  vnoremap <leader>d :m'>+<CR>gv=gv
  " }}}

  " Search and replace word under cursor (,*) {{{
  nnoremap <leader>* :%s/\<<C-r><C-w>\>//g<Left><Left>
  vnoremap <leader>* "hy:%s/\V<C-r>h//<left>
  " }}}

  " Add space between equal signs {{{
  nnoremap <leader>= :%s/\s\@<!=\+\s\@!/ \0 /g<CR>
  "}}}

  " Join lines and restore cursor location (J) {{{
  nnoremap J mjJ`j
  " }}}

  " Toggle folds (<Space>) {{{
  nnoremap <silent> <space> :exe 'silent! normal! '.((foldclosed('.')>0)? 'zMzx' : 'zc')<CR>
  " }}}

  " Set configuration for increment number {{{
  nnoremap <C-i> <C-a>
  " }}}

  " Fix page up and down {{{
  map <PageUp> <C-U>
  map <PageDown> <C-D>
  imap <PageUp> <C-O><C-U>
  imap <PageDown> <C-O><C-D>
  " }}}
augroup END
" }}}

" NERD Commenter {{{
augroup nerd_commenter
  autocmd!

  let NERDSpaceDelims=1
  let NERDCompactSexyComs=1
  let g:NERDCustomDelimiters = { 'racket': { 'left': ';', 'leftAlt': '#|', 'rightAlt': '|#' } }
augroup END
" }}}

" Word Processor Mode {{{
augroup word_processor_mode
  autocmd!

  function! WordProcessorMode() " {{{
    setlocal formatoptions=t1
    map j gj
    map k gk
    setlocal smartindent
    setlocal spell spelllang=en_us
    setlocal noexpandtab
    setlocal wrap
    setlocal linebreak
    Goyo 100
  endfunction " }}}
  com! WP call WordProcessorMode()
augroup END
" }}}

" Filetypes -------------------------------------------------------------

" Bibtex {{{
augroup filetype_bibtex
  autocmd!
  au BufNewFile,BufReadPost *.bibtex setl filetype=bibtex
augroup END
" }}}

" Coffee {{{
augroup filetype_coffee
  autocmd!
  au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
augroup END
" }}}

" JavaScript {{{
augroup filetype_javascript
  autocmd!
  let g:javascript_conceal = 1
augroup END
" }}}

" JSX {{{
augroup filetype_jsx
  autocmd!
  au BufNewFile,BufRead *.jsx set filetype=javascript.react
augroup END
" }}}

" JSON {{{
augroup filetype_json
  autocmd!
  au BufRead,BufNewFile *.json set ft=json syntax=javascript
augroup END
" }}}

" Markdown {{{
augroup filetype_markdown
  autocmd!
  au BufRead,BufNewFile *.md set shiftwidth=4
  au BufRead,BufNewFile *.md let b:surround_42 = "**\r**"
  au BufRead,BufNewFile *.md let b:surround_95 = "_\r_"
  au BufRead,BufNewFile *.md let b:surround_241 = "¡\r!"
  au BufRead,BufNewFile *.md let b:surround_241 = "¡\r!"
  au FileType markdown vmap <Leader>i :EasyAlign*<Bar><Enter>
  let g:markdown_fenced_languages = ['ruby', 'html', 'javascript', 'css', 'erb=eruby.html', 'bash=sh']
augroup END
" }}}

" Mustache {{{
augroup filetype_mustache
  autocmd!
  au BufRead,BufNewFile *.slimbars set ft=mustache
augroup END
" }}}

" Ruby {{{
augroup filetype_ruby
  autocmd!

  au BufRead,BufNewFile Rakefile,Capfile,Gemfile set ft=ruby syntax=ruby

  " Ruby.vim {{{
  let ruby_operators = 1
  let ruby_space_errors = 1
  let ruby_fold = 1
  " }}}
augroup END
" }}}

" TSX {{{
augroup filetype_tsx
  autocmd!
  au BufNewFile,BufRead *.tsx set filetype=typescript.react
augroup END
" }}}

" YAML {{{
au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml foldmethod=indent
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
"}}}

" ZSH {{{
augroup filetype_zsh
  autocmd!
  au BufRead,BufNewFile .zsh_rc,.functions,.commonrc,.git_stuff set ft=zsh
augroup END
" }}}

" Plugin Configuration -------------------------------------------------------------

"{{{ Ack.vim
if executable('rg')
  let g:ackprg = 'rg --column'
elseif executable('ag')
  let g:ackprg = 'ag --nogroup --nocolor --column'
endif
"}}}

" Ale.vim {{{
augroup ale_config
  autocmd!
  let g:ale_sign_error = '✗'
  let g:ale_sign_warning = '⚠'

  let g:ale_completion_enabled = 1

  let g:ale_linter_aliases = {'jsx': ['javascript'] }
  let g:ale_linters = {
  \ 'javascript': ['eslint', 'flow-language-server']
  \}

  let g:ale_fixers = {
  \ '*': ['remove_trailing_lines', 'trim_whitespace'],
  \ 'javascript': ['eslint'],
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

" RainbowParenthesis.vim {{{
augroup rainbow_parenthesis_config
  autocmd!
  nnoremap <leader>rp :RainbowParenthesesToggle<CR>
augroup END
" }}}

" UltiSnips.vim {{{
nmap <leader>s :UltiSnipsEdit<cr>
let g:UltiSnipsSnippetDirectories=["~/.vim/my_snippets"]
let g:UltiSnipsEditSplit="vertical"
"}}}

" Plugins -------------------------------------------------------------

" Load plugins {{{
call plug#begin('~/.vim/plugged')

Plug '/usr/local/opt/fzf'
Plug 'SirVer/ultisnips'
Plug 'bling/vim-airline'
Plug 'christoomey/vim-sort-motion'
Plug 'dense-analysis/ale'
Plug 'ekalinin/Dockerfile.vim', {'on': 'Dockerfile'}
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf.vim', {'on': ['GFiles', 'Files', 'Rg']}
Plug 'junegunn/vim-easy-align', { 'for': 'markdown' }
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-user'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'keith/swift.vim', {'for': 'swift'}
Plug 'leafgarland/typescript-vim', {'for': 'typescript'}
Plug 'lucapette/vim-textobj-underscore'
Plug 'maxmellon/vim-jsx-pretty', {'for': ['js', 'jsx']}
Plug 'mustache/vim-mustache-handlebars', {'for': ['mustache']}
Plug 'mileszs/ack.vim', {'on': 'Ack'}
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
Plug 'yuezk/vim-js', { 'for': 'js' }

call plug#end()
" }}}
