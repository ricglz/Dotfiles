" vim:fdm=indent foldlevel=0
" Based on: https://github.com/mkitt/tabline.vim/blob/master/plugin/tabline.vim


if exists("g:tabline_loaded")
    finish
endif

let g:tabline_loaded = 1

augroup show_tabline
  autocmd!
  set tabline=%!tabline#show()
augroup END

function! tabline#show() abort
  let s = ''
  for buf in getbufinfo({'buflisted':1})
    let bufname = buf.name
    let bufnum = buf.bufnr
    let bufmodified = buf.changed

    let s .= '%' . bufnum . 'T'
    let s .= (bufnum == bufnr() ? '%#TabLineSel#' : '%#TabLine#')
    let s .= ' ' . bufnum .':'
    let s .= (bufname != '' ? '['. fnamemodify(bufname, ':t') . '] ' : '[No Name] ')

    if bufmodified
      let s .= '[+] '
    endif
  endfor
  let s .= '%#TabLineFill#'
  return s
endfunction
