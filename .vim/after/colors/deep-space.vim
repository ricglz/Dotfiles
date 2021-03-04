" Color Palette
let s:gray1     = '#1b202a'
let s:gray2     = '#232936'
let s:gray3     = '#323c4d'
let s:gray4     = '#51617d'
let s:gray5     = '#9aa7bd'
let s:red       = '#b15e7c'
let s:green     = '#709d6c'
let s:yellow    = '#b5a262'
let s:blue      = '#608cc3'
let s:purple    = '#8f72bf'
let s:cyan      = '#56adb7'
let s:orange    = '#b3785d'
let s:pink      = '#c47ebd'

function! s:HL(group, fg, bg, attr)
    let l:attr = a:attr
    if !g:deepspace_italics && l:attr ==# 'italic'
        let l:attr = 'none'
    endif

    if !empty(a:fg)
        exec 'hi ' . a:group . ' guifg=' . a:fg
    endif
    if !empty(a:bg)
        exec 'hi ' . a:group . ' guibg=' . a:bg
    endif
    if !empty(a:attr)
        exec 'hi ' . a:group . ' gui=' . l:attr . ' cterm=' . l:attr
    endif
endfun

" BufTabs Plugin {{{
hi link BufTabLineCurrent TabLineSel
hi link BufTabLineActive  PmenuSel
hi link BufTabLineHidden  TabLine
hi link BufTabLineFill    TabLineFill
" }}}

" StatusLine Plugin {{{
call s:HL('stlDirInfo', s:gray5, s:gray2, 'bold')
call s:HL('stlErrorInfo', s:red, s:gray2, 'bold')
call s:HL('stlInsertMode', s:green, s:gray2, 'bold')
call s:HL('stlModified', s:pink, s:gray3, 'bold')
call s:HL('stlNormalMode', s:purple, s:gray2, 'bold')
call s:HL('stlReplaceMode', s:cyan, s:gray2, 'bold')
call s:HL('stlSelectMode', s:cyan, s:gray2, 'bold')
call s:HL('stlTerminalMode', s:pink, s:gray2, 'bold')
call s:HL('stlTypeInfo', s:cyan, s:gray1, 'none')
call s:HL('stlVisualMode', s:orange, s:gray2, 'none')
" }}}
