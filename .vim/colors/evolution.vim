" vim:fdm=marker foldlevel=0
" 'evolution.vim' -- Vim color scheme.
" Original Author:  Matt Simmons (mtszyk@gmail.com)
" Modifier:         Ricardo González
" Last Change:      2020-05-07

" Preamble {{{
hi clear

if exists('syntax_on')
  syntax reset
endif

let g:colors_name='evolution'
set background=dark
" }}}
" Functions {{{
function! s:Highlight(args)
  exec 'highlight ' . join(a:args, ' ')
endfunction

function! s:AddGroundValues(accumulator, ground, color)
  let new_list = a:accumulator
  for [where, value] in items(a:color)
    if value == "NONE" || value == "none" || value == ""
      call add(new_list, where . a:ground . '= NONE')
    else
      call add(new_list, where . a:ground . '=' . value)
    endif
  endfor

  return new_list
endfunction

function! s:Col(group, fg_name, ...)
  " ... = optional bg_name

  let pieces = [a:group]

  if a:fg_name !=# ''
    let pieces = s:AddGroundValues(pieces, 'fg', s:colors[a:fg_name])
  endif

  if a:0 > 0 && a:1 !=# ''
    let pieces = s:AddGroundValues(pieces, 'bg', s:colors[a:1])
  endif

  call s:Clear(a:group)
  call s:Highlight(pieces)
endfunction

function! s:Attr(group, attr)
  let l:attrs = [a:group, 'term=' . a:attr, 'cterm=' . a:attr, 'gui=' . a:attr]
  call s:Highlight(l:attrs)
endfunction

function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction
"}}}
" Colors {{{
let s:colors = {}

let s:colors.aqua_green = { 'cterm': 73, 'gui': '#72b7b5' }
let s:colors.black = { 'cterm': 234, 'gui': '#1d2021' }
let s:colors.brown = { 'cterm': 237, 'gui': '#3c3836' }
let s:colors.brown_2 = { 'cterm': 239, 'gui': '#504945' }
let s:colors.dark_aqua_green = { 'cterm': 73, 'gui': '#6fa3a6' }
let s:colors.dark_brown = { 'cterm': 173, 'gui': '#2c2824' }
let s:colors.dark_green = { 'cterm': 65, 'gui': '#29342d' }
let s:colors.grey = { 'cterm': 235, 'gui': '#282828' }
let s:colors.light_brown = { 'cterm': 102, 'gui': '#948774' }
let s:colors.light_yellow = { 'cterm': 187, 'gui': '#d5c4a1' }
let s:colors.light_yellow_2 = { 'cterm': 234, 'gui': '#d5c4a1' }
let s:colors.none = { 'cterm': 'NONE', 'gui': 'NONE' }
let s:colors.orange = { 'cterm': 173, 'gui': '#c7743e' }
let s:colors.purple = { 'cterm': 139, 'gui': '#b48ead' }
let s:colors.red = { 'cterm': 167, 'gui': '#D84A44' }
let s:colors.washed_aqua_green = { 'cterm': 65, 'gui': '#83a598' }
let s:colors.washed_green = { 'cterm': 65, 'gui': '#91BA93' }
let s:colors.washed_yellow = { 'cterm': 144, 'gui': '#bdae93' }
let s:colors.yellow = { 'cterm': 172, 'gui': '#d79921' }
" }}}
" General colorscheme {{{
" Text; Miscellaneous {{{
call s:Col('Directory', 'aqua_green')
call s:Col('NonText', 'brown')
call s:Col('Normal', 'light_yellow')
call s:Col('Normal', 'light_yellow', 'black')
call s:Col('SignColumn', 'grey', 'black')
call s:Col('SpecialComment', 'aqua_green')
call s:Col('VertSplit', 'brown')
call s:Col('SpecialKey', 'light_brown')
call s:Col('QuickFixLine', 'none', 'dark_brown')
call s:Col('SpecialChar', 'yellow')
" }}}

" Cursor {{{
call s:Col('Cursor', 'black', 'light_yellow_2')
call s:Col('CursorColumn', 'none', 'grey')
call s:Col('CursorIM', 'black', 'light_yellow')
call s:Col('CursorLine', 'none', 'grey')
call s:Col('CursorLineNr', 'aqua_green', 'black')
" }}}

" Folding {{{
call s:Col('FoldColumn', 'brown_2', 'black')
call s:Col('Folded', 'light_brown', 'grey')
" }}}

" Line info {{{
call s:Col('ColorColumn', 'none', 'grey')
call s:Col('LineNr', 'brown_2', 'black')
call s:Col('StatusLine', 'washed_yellow', 'grey')
call s:Col('StatusLineNC', 'light_brown', 'brown')
call s:Col('StatusLineTerm', 'aqua_green', 'brown')
call s:Col('StatusLineTermNC', 'light_yellow', 'grey')
" }}}

" Messages {{{
call s:Col('ErrorMsg', 'light_yellow', 'red')
call s:Col('ModeMsg', 'light_yellow')
call s:Col('MoreMsg', 'light_yellow')
call s:Col('Question', 'light_yellow')
call s:Col('WarningMsg', 'red', 'black')
" }}}

" Search {{{
call s:Col('IncSearch', 'grey', 'orange')
call s:Col('Search', 'grey', 'orange')
" }}}

" Diff {{{
call s:Col('Add', 'none', 'dark_green')
hi DiffChange ctermfg=NONE guifg=NONE ctermbg=172 guibg=#3c3421 cterm=NONE gui=NONE
hi DiffDelete ctermfg=NONE guifg=NONE ctermbg=167 guibg=#4c2b2a cterm=NONE gui=NONE
hi DiffText   ctermfg=NONE guifg=NONE ctermbg=108 guibg=#2b393a cterm=NONE gui=NONE
" }}}

" Menu {{{
call s:Col('PMenu', 'light_yellow', 'grey')
call s:Col('PMenuSel', 'aqua_green', 'brown')
call s:Col('PmenuSbar', 'light_yellow', 'grey')
call s:Col('PmenuThumb', 'light_yellow', 'grey')
call s:Col('WildMenu', 'aqua_green', 'brown_2')
hi PmenuThumb ctermfg=138 guifg=#a89984 ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
" }}}

" Tabs {{{
call s:Col('TabLine', 'light_brown', 'grey')
call s:Col('TabLineFill', 'light_brown', 'grey')
call s:Col('TabLineSel', 'light_brown', 'brown_2')
" }}}

" Visual Mode {{{
call s:Col('Visual', 'none', 'brown')
call s:Col('VisualNOS', 'none', 'brown')
" }}}

" Code {{{
call s:Col('Comment', 'light_brown')
call s:Col('Constant', 'light_yellow')
call s:Col('Error', 'red')
call s:Col('Function', 'dark_aqua_green')
call s:Col('Identifier', 'washed_green')
call s:Col('MatchParen', 'aqua_green', 'brown_2')
call s:Col('Number', 'purple')
call s:Col('Special', 'light_yellow')
call s:Col('Todo', 'yellow')

call s:Attr('Error', 'bold')
call s:Attr('Todo', 'bold')
hi PreProc    ctermfg=108 guifg=#83a598 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Statement  ctermfg=108 guifg=#83a598 ctermbg=NONE guibg=NONE    cterm=bold gui=bold
hi String     ctermfg=65  guifg=#679a69 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Type       ctermfg=108 guifg=#83a598 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
" }}}

" Spell {{{
hi SpellBad   ctermbg=NONE guibg=NONE ctermfg=167 guifg=#D84A44 cterm=undercurl gui=undercurl guisp=NONE
hi SpellCap   ctermbg=NONE guibg=NONE ctermfg=73  guifg=#72b7b5 cterm=undercurl gui=undercurl guisp=NONE
hi SpellLocal ctermbg=NONE guibg=NONE ctermfg=65  guifg=#679a69 cterm=undercurl gui=undercurl guisp=NONE
hi SpellRare  ctermbg=NONE guibg=NONE ctermfg=173 guifg=#c7743e cterm=undercurl gui=undercurl guisp=NONE
" }}}
" }}}
" Terminal colors {{{
if has('nvim')
  let g:terminal_color_0  = '#1d2021'
  let g:terminal_color_1  = '#D84A44'
  let g:terminal_color_2  = '#91ba93'
  let g:terminal_color_3  = '#d65d0e'
  let g:terminal_color_4  = '#83a598'
  let g:terminal_color_5  = '#b48ead'
  let g:terminal_color_6  = '#84d4d2'
  let g:terminal_color_7  = '#a89984'
  let g:terminal_color_8  = '#948774'
  let g:terminal_color_9  = '#D84A44'
  let g:terminal_color_10 = '#679a69'
  let g:terminal_color_11 = '#d79921'
  let g:terminal_color_12 = '#6fa3a6'
  let g:terminal_color_13 = '#b48ead'
  let g:terminal_color_14 = '#72b7b5'
  let g:terminal_color_15 = '#d5c4a1'
else
  let g:terminal_ansi_colors = ['#1d2021', '#D84A44', '#91ba93', '#d65d0e',
        \ '#83a598', '#b48ead', '#84d4d2', '#a89984', '#948774', '#D84A44',
        \ '#679a69', '#d79921', '#6fa3a6', '#b48ead', '#72b7b5', '#d5c4a1']
endif
" }}}
" Linked groups {{{
" Code {{{
hi link Boolean      PreProc
hi link Character    String
hi link Conceal      Whitespace
hi link Conditional  PreProc
hi link Debug        Special
hi link Define       PreProc
hi link Delimiter    Special
hi link Exception    PreProc
hi link Float        Number
hi link Include      PreProc
hi link Keyword      PreProc
hi link Label        PreProc
hi link Macro        PreProc
hi link Operator     PreProc
hi link PreCondit    PreProc
hi link Repeat       PreProc
hi link StorageClass PreProc
hi link Structure    PreProc
hi link Tag          Special
hi link Terminal     Normal
hi link Typedef      PreProc
" }}}

" BufTabs Plugin {{{
hi link BufTabLineCurrent TabLineSel
hi link BufTabLineActive  PmenuSel
hi link BufTabLineHidden  TabLine
hi link BufTabLineFill    TabLineFill
" }}}

" StatusLine Plugin {{{
hi stlDirInfo      ctermfg=116 guifg=#84d4d2 ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
hi stlErrorInfo    ctermfg=167 guifg=#d84a44 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi stlInsertMode   ctermfg=234 guifg=#1d2021 ctermbg=65  guibg=#679a69 cterm=bold gui=bold
hi stlModified     ctermfg=167 guifg=#D84A44 ctermbg=235 guibg=#282828 cterm=bold gui=bold
hi stlNormalMode   ctermfg=172 guifg=#d79921 ctermbg=239 guibg=#504945 cterm=bold gui=bold
hi stlReplaceMode  ctermfg=234 guifg=#1d2021 ctermbg=73  guibg=#6fa3a6 cterm=NONE gui=NONE
hi stlSelectMode   ctermfg=234 guifg=#1d2021 ctermbg=73  guibg=#6fa3a6 cterm=NONE gui=NONE
hi stlTerminalMode ctermfg=139 guifg=#b48ead ctermbg=239 guibg=#504945 cterm=NONE gui=NONE
hi stlTypeInfo     ctermfg=73  guifg=#6fa3a6 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi stlVisualMode   ctermfg=234 guifg=#1d2021 ctermbg=173 guibg=#c7743e cterm=NONE gui=NONE
" }}}

" Rails Specific {{{
hi def link rubyAction         rubyControl
hi def link rubyAssertion      rubyException
hi def link rubyCallback       rubyMacro
hi def link rubyEntities       rubyMacro
hi def link rubyEntity         rubyMacro
hi def link rubyExceptionMacro rubyMacro
hi def link rubyHelper         Function
hi def link rubyMacro          Macro
hi def link rubyRakeMacro      rubyMacro
hi def link rubyResponse       rubyControl
hi def link rubyRoute          rubyControl
hi def link rubySchema         rubyControl
hi def link rubyTestAction     rubyControl
hi def link rubyTestHelper     rubyHelper
hi def link rubyTestMacro      rubyMacro
hi def link rubyUrlHelper      rubyHelper
hi def link rubyUserAssertion  rubyAssertion
hi def link rubyValidation     rubyMacro
hi def link rubyViewHelper     rubyHelper
" }}}

" Markdown Specific {{{
hi def link markdownCode             String
hi def link markdownCodeBlock        String
hi def link markdownH1               Todo
hi def link markdownH2               Todo
hi def link markdownH3               Todo
hi def link markdownHeadingDelimiter Todo
" }}}
" }}}
unlet s:colors
