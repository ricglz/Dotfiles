-- ================= File management ================= --

-- swapfile has global & local config, eventhough help says otherwise
vim.o.swapfile = false
vim.bo.swapfile = false
vim.o.backup = false
vim.o.writebackup = false

-- ================= Scrolling ================= --

vim.o.scrolloff = 3

-- ================= Visualization ================= --

vim.o.termguicolors = true
vim.o.background = 'dark'
vim.cmd('colorscheme material')
vim.g.material_style = 'darker'

--
-- ================= Indentation ================= --

-- pay attention to 'vim.bo' (buffer local options) and 'vim.o' (global
-- options) see :help options.txt

-- for some reason these values need to be set in both o and bo objects
-- eventhough these options are supposed to be local to buffer

vim.o.tabstop = 4
vim.bo.tabstop = 4
vim.o.shiftwidth = 4
vim.bo.shiftwidth = 4
vim.o.softtabstop = 4
vim.bo.softtabstop = 4
vim.o.expandtab = true
vim.bo.expandtab = true
vim.o.smartindent = true
vim.bo.smartindent = true
vim.o.autoindent = true
vim.bo.autoindent = true
vim.o.smarttab = true

-- ================= Number column ================= --

vim.wo.number = true
vim.wo.relativenumber = true

-- ================= Search ================= --

vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.hlsearch = false

-- ================= Performance ================= --

vim.o.lazyredraw = true
vim.o.ttimeoutlen = 10


-- ================= Misc ================= --

vim.wo.wrap = false
vim.o.updatetime = 300

-- better autocomplete behaviour
-- menuone - show popup menu also when there is only one match available
-- preview - show extra information about currently selected completion
-- noinsert - do not insert any text for match until the user selects it from the menu
vim.o.completeopt='menuone,preview,noinsert,noselect'

-- allows hidden buffers
-- this means that a modified buffer doesn't need to be saved when changing
-- tabs/windows.
vim.o.hidden=true

-- Copy paste between vim and everything else
vim.o.clipboard = "unnamedplus"
