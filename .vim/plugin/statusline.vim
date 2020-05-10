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
  let statuslinetext  = statusline#mode(1)
  let statuslinetext .= '%*'
  let statuslinetext .= statusline#fileinfo(1)
  let statuslinetext .= '%='
  let statuslinetext .= statusline#temporary()
  let statuslinetext .= statusline#errors()
  let statuslinetext .= '%#stlTypeInfo# %y '
  let statuslinetext .= statusline#cursorinfo(1)
  return statuslinetext
endfunction

function! statusline#inactive() abort
  let statuslinetext  = '%#SignColumn# %*%3.3( %)'
  let statuslinetext .= '%*'
  let statuslinetext .= statusline#fileinfo(0)
  let statuslinetext .= '%='
  let statuslinetext .= '%y '
  let statuslinetext .= '%{statusline#encoding(0)}'
  return statuslinetext
endfunction

function! statusline#mode(active) abort
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

function! statusline#temporary() abort
  let expr = get(b:, 'stl#tmp', get(g:, 'stl#tmp', ''))
  return !empty(expr) ? eval(expr) . ' ' : ''
endfunction

function! statusline#encoding(active)
  " Returns: 'encoding[lineendings]' in the same width as statusline#cursorinfo()
  let linedigits = float2nr(ceil(log10(line('$') + 1)))
  let stl_typeinfo = (&fileencoding ? &fileencoding : &encoding) . '[' . &fileformat . ']'
  let stl_typeinfo .= repeat(' ', 14 + 2 * linedigits - len(stl_typeinfo))
  return stl_typeinfo
endfunction

function! statusline#cursorinfo(active) abort
  " Returns: '%line/lines ☰ lineno/lines : colnum'
  let linedigits = float2nr(ceil(log10(line('$') + 1)))
  let nwid = '%' . linedigits . '.' . linedigits
  let statuslinetext = s:modecolor() . ' %2p%% ☰ '  " U+2630
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

  let errors_count = ale#statusline#Count(winbufnr(0)).total
  if errors_count > 0 | let statuslinetext .= ' #' . errors_count | endif
  let statuslinetext .= '%*'
  return statuslinetext
endfunction

let s:modes ={
      \ 'n'  : ['%#stlNormalMode#', 'NORMAL'],
      \ 'i'  : ['%#stlInsertMode#', 'INSERT'],
      \ 'v'  : ['%#stlVisualMode#', 'VISUAL'],
      \ 'V'  : ['%#stlVisualMode#', 'VISUAL'],
      \ '' : ['%#stlVisualMode#', 'B'],
      \ 'R'  : ['%#stlReplaceMode#', 'REPLACE'],
      \ 's'  : ['%#stlSelectMode#', 's'],
      \ 'S'  : ['%#stlSelectMode#', 'S'],
      \ 'c'  : ['%#stlTerminalMode#', 'COMMAND'],
      \ 't'  : ['%#stlTerminalMode#', 't'],
      \ '-'  : ['%#stlNormalMode#', '-']}
