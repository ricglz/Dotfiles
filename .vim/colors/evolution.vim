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
" General colorscheme {{{
" Text; Miscellaneous {{{
hi Directory      ctermfg=73   guifg=#72b7b5    ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi NonText        ctermfg=237  guifg=#3c3836    ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Normal         ctermfg=187  guifg=#d5c4a1    ctermbg=234  guibg=#1d2021 cterm=NONE gui=NONE
hi SignColumn     ctermfg=235  guifg=#282828    ctermbg=234  guibg=#1d2021 cterm=NONE gui=NONE
hi SpecialKey     ctermfg=102  guifg=#948774    ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Title          ctermfg=187  guifg=#d5c4a1    ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi VertSplit      ctermfg=237  guifg=#3c3836    ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi QuickFixLine   ctermfg=NONE guifg=NONE       ctermbg=173  guibg=#2c2824 cterm=NONE gui=NONE
hi SpecialChar    ctermfg=172  guifg=#d79921    ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi SpecialComment ctermfg=73   guifg=#72b7b5    ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
" }}}

" Cursor {{{
hi Cursor       ctermfg=234  guifg=#1d2021 ctermbg=187 guibg=#d5c4a1 cterm=NONE gui=NONE
hi CursorColumn ctermfg=NONE guifg=NONE    ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi CursorIM     ctermfg=234  guifg=#1d2021 ctermbg=187 guibg=#d5c4a1 cterm=NONE gui=NONE
hi CursorLine   ctermfg=NONE guifg=NONE    ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi CursorLineNr ctermfg=73   guifg=#72b7b5 ctermbg=234 guibg=#1d2021 cterm=NONE gui=NONE
" }}}

" Folding {{{
hi FoldColumn ctermfg=239 guifg=#504945 ctermbg=234 guibg=#1d2021 cterm=NONE gui=NONE
hi Folded     ctermfg=102 guifg=#948774 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
" }}}

" Line info {{{
hi ColorColumn      ctermfg=NONE guifg=NONE    ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi LineNr           ctermfg=239  guifg=#504945 ctermbg=234 guibg=#1d2021 cterm=NONE gui=NONE
hi StatusLine       ctermfg=144  guifg=#bdae93 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi StatusLineNC     ctermfg=102  guifg=#948774 ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
hi StatusLineTerm   ctermfg=73   guifg=#72b7b5 ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
hi StatusLineTermNC ctermfg=187  guifg=#d5c4a1 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
" }}}

" Messages {{{
hi ErrorMsg   ctermfg=187 guifg=#d5c4a1 ctermbg=167  guibg=#D84A44 cterm=NONE gui=NONE
hi ModeMsg    ctermfg=187 guifg=#d5c4a1 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi MoreMsg    ctermfg=187 guifg=#d5c4a1 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Question   ctermfg=187 guifg=#d5c4a1 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi WarningMsg ctermfg=167 guifg=#D84A44 ctermbg=234  guibg=#1d2021 cterm=NONE gui=NONE
" }}}

" Search {{{
hi IncSearch ctermfg=235 guifg=#282828 ctermbg=173 guibg=#c7743e cterm=NONE gui=NONE
hi Search    ctermfg=235 guifg=#282828 ctermbg=173 guibg=#c7743e cterm=NONE gui=NONE
" }}}

" Diff {{{
hi DiffAdd    ctermfg=NONE guifg=NONE ctermbg=65  guibg=#29342d cterm=NONE gui=NONE
hi DiffChange ctermfg=NONE guifg=NONE ctermbg=172 guibg=#3c3421 cterm=NONE gui=NONE
hi DiffDelete ctermfg=NONE guifg=NONE ctermbg=167 guibg=#4c2b2a cterm=NONE gui=NONE
hi DiffText   ctermfg=NONE guifg=NONE ctermbg=108 guibg=#2b393a cterm=NONE gui=NONE
" }}}

" Menu {{{
hi PMenu      ctermfg=187 guifg=#d5c4a1 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi PMenuSel   ctermfg=73  guifg=#72b7b5 ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
hi PmenuSbar  ctermfg=187 guifg=#d5c4a1 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi PmenuThumb ctermfg=138 guifg=#a89984 ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
hi WildMenu   ctermfg=73  guifg=#72b7b5 ctermbg=239 guibg=#504945 cterm=NONE gui=NONE
" }}}

" Tabs {{{
hi TabLine     ctermfg=102 guifg=#948774 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi TabLineFill ctermfg=102 guifg=#948774 ctermbg=235 guibg=#282828 cterm=NONE gui=NONE
hi TabLineSel  ctermfg=102 guifg=#948774 ctermbg=239 guibg=#504945 cterm=NONE gui=NONE
" }}}

" Visual Mode {{{
hi Visual    ctermfg=NONE guifg=NONE ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
hi VisualNOS ctermfg=NONE guifg=NONE ctermbg=237 guibg=#3c3836 cterm=NONE gui=NONE
" }}}

" Code {{{
hi Comment    ctermfg=102 guifg=#948774 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Constant   ctermfg=187 guifg=#d5c4a1 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Error      ctermfg=167 guifg=#D84A44 ctermbg=NONE guibg=NONE    cterm=bold gui=bold
hi Function   ctermfg=73  guifg=#6fa3a6 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Identifier ctermfg=65  guifg=#91ba93 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi MatchParen ctermfg=73  guifg=#72b7b5 ctermbg=239  guibg=#504945 cterm=NONE gui=NONE
hi Number     ctermfg=139 guifg=#b48ead ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi PreProc    ctermfg=108 guifg=#83a598 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Special    ctermfg=187 guifg=#d5c4a1 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Statement  ctermfg=108 guifg=#83a598 ctermbg=NONE guibg=NONE    cterm=bold gui=bold
hi String     ctermfg=65  guifg=#679a69 ctermbg=NONE guibg=NONE    cterm=NONE gui=NONE
hi Todo       ctermfg=172 guifg=#d79921 ctermbg=NONE guibg=NONE    cterm=bold gui=bold
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
  let g:terminal_ansi_colors = [
        \ '#1d2021',
        \ '#D84A44',
        \ '#91ba93',
        \ '#d65d0e',
        \ '#83a598',
        \ '#b48ead',
        \ '#84d4d2',
        \ '#a89984',
        \ '#948774',
        \ '#D84A44',
        \ '#679a69',
        \ '#d79921',
        \ '#6fa3a6',
        \ '#b48ead',
        \ '#72b7b5',
        \ '#d5c4a1']
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
