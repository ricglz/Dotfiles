local set = vim.opt

local wildignore = '*.jpg,*.jpeg,*.gif,*.png,*.gif,*.psd,*.o,*.obj,*.min.js'
wildignore = wildignore .. '*/bower_components/*,*/node_modules/*,*/vendor/*,*/.git/*'
wildignore = wildignore .. '*/build/*,*/ckeditor/*,*/doc/*,*/source_maps/*,*/dist/*'
wildignore = wildignore .. '*/smarty/*,*/.hg/*,*/.svn/*,*/.sass-cache/*,*/log/*,*/tmp/*'

set.autoindent = true
set.background = 'dark'
set.backspace = 'indent,eol,start'
set.backup = false
set.clipboard = 'unnamed'
set.cmdheight = 2
set.completeopt = 'menu,menuone,noselect'
set.cursorcolumn = true
set.cursorline = true
set.encoding = 'utf8'
set.errorbells = false
set.expandtab = true
set.foldenable = true
set.foldmethod = 'syntax'
set.foldnestmax = 5
set.formatoptions = 'j1ncroql'
set.hidden = true
set.hlsearch = false
set.ignorecase = true
set.incsearch = true
set.laststatus = 2
set.lazyredraw = true
set.magic = true
set.number = true
set.omnifunc = 'syntaxcomplete#Complete'
set.regexpengine = 1
set.relativenumber = true
set.ruler = true
set.scrolloff = 3
set.shell = '/bin/zsh'
set.shiftwidth = 2
set.shortmess = 'astTIc'
set.showmode = false
set.showtabline = 2
set.signcolumn = 'yes'
set.smartcase = true
set.smarttab = true
set.softtabstop = 2
set.splitbelow = true
set.splitright = true
set.startofline = false
set.suffixes = '.bak,~,.swp,.swo,.o,.d,.info,.aux,.log,.dvi,.pdf,.bin,.bbl,.blg,.brf,.cb,.dmg,.exe,.ind,.idx,.ilg,.inx,.out,.toc,.pyc,.pyd,.dll'
set.swapfile = false
set.termguicolors = true
set.title = true
set.undofile = true
set.updatetime = 300
set.wildignore = wildignore .. 'DS_Store'
set.wildmenu = true
set.wildmode = 'list:longest'
set.winminheight = 0
set.wrap = false
set.wrapscan = true
set.writebackup = false
