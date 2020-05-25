" vim:fdm=indent foldlevel=0
" Based on: https://github.com/milisims/vimfiles/blob/master/plugin/statusline.vim

if exists("g:statusline_loaded")
    finish
endif

let g:statusline_loaded = 1

augroup show_statusline
  autocmd!
  set statusline=%!statusline#inactive()
  autocmd WinLeave * setlocal statusline=%!statusline#inactive()
  autocmd WinEnter,BufEnter * setlocal statusline=%!statusline#active()
augroup END

function! statusline#active() abort
  let statuslinetext  = statusline#mode()
  let statuslinetext .= '%*'
  let statuslinetext .= statusline#fileinfo(1)
  let statuslinetext .= '%='
  let statuslinetext .= statusline#errors()
  let statuslinetext .= '%#stlTypeInfo# %y ' " Filetype
  let statuslinetext .= statusline#cursorinfo()
  return statuslinetext
endfunction

function! statusline#inactive() abort
  let statuslinetext  = '%#SignColumn# %*%3.3( %)' " Generates a padding
  let statuslinetext .= '%*'
  let statuslinetext .= statusline#fileinfo(0)
  let statuslinetext .= '%='
  let statuslinetext .= '%y ' " Filetype
  let statuslinetext .= '%{statusline#encoding()}'
  return statuslinetext
endfunction

function! statusline#mode() abort
  return ' ' . s:modecolor() . ' ' . get(s:modes, mode(), '-')[1] . ' %)'
endfunction

function! statusline#fileinfo(active) abort
  " Returns: 'filename modified spacer'
  let statuslinetext = ' %f'
  " Should catch attention when unfocused
  if a:active
    let statuslinetext .= &modifiable ? '%#stlModified#' : ''
  endif
  let statuslinetext .= ' %m'
  let statuslinetext .= '%*'
  return statuslinetext
endfunction

function! statusline#encoding()
  " Returns: 'encoding[lineendings]' in the same width as statusline#cursorinfo()
  let linedigits = float2nr(ceil(log10(line('$') + 1)))
  let stl_typeinfo = (&fileencoding ? &fileencoding : &encoding) . '[' . &fileformat . ']'
  let stl_typeinfo .= repeat(' ', 14 + 2 * linedigits - len(stl_typeinfo))
  return stl_typeinfo
endfunction

function! statusline#cursorinfo() abort
  " Returns: '%line/lines ☰ lineno/lines : colnum'
  let linedigits = float2nr(ceil(log10(line('$') + 1)))
  let nwid = '%' . linedigits . '.' . linedigits
  let statuslinetext = s:modecolor()
  if &ft == 'markdown' | let statuslinetext .= ' W:%{wordcount().words}' | endif
  let statuslinetext .= ' %2p%% ☰ '  " U+2630
  let statuslinetext .= nwid . 'l/' . nwid .  'L : %02c %*'
  return statuslinetext
endfunction

function! s:modecolor() abort
  return get(s:modes, mode(), '%*')[0]
endfunction

function! statusline#errors() abort
  let statuslinetext = '%#stlErrorInfo#'
  if !has('vim_starting')
    if &modifiable && search('^\t', 'nw', line('.') + 1) && search('^  [^\s]', 'nw')
      let statuslinetext .= ' MIXED INDENT '
    endif
  endif

  let errors_count = ale#statusline#Count(winbufnr(0)).error
  if errors_count > 0 | let statuslinetext .= ' #' . errors_count | endif
  let statuslinetext .= '%*'
  return statuslinetext
endfunction

let s:modes ={
      \ 'n'  : ['%#stlNormalMode#', 'NORMAL'],
      \ 'i'  : ['%#stlInsertMode#', 'INSERT'],
      \ 'v'  : ['%#stlVisualMode#', 'VISUAL'],
      \ 'V'  : ['%#stlVisualMode#', 'VISUAL'],
      \ '' : ['%#stlVisualMode#', 'VISUAL'],
      \ 'R'  : ['%#stlReplaceMode#', 'REPLACE'],
      \ 's'  : ['%#stlSelectMode#', 'SELECT'],
      \ 'S'  : ['%#stlSelectMode#', 'SELECT'],
      \ 'c'  : ['%#stlTerminalMode#', 'COMMAND'],
      \ 't'  : ['%#stlTerminalMode#', 'TERMINAL'],
      \ '-'  : ['%#stlNormalMode#', '-']}
