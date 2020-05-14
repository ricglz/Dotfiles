" vim:fdm=indent foldlevel=0
" Based on: https://github.com/mkitt/tabline.vim/blob/master/plugin/tabline.vim

if exists("g:tabline_loaded")
    finish
endif

let g:tabline_loaded = 1

augroup tabline_config
  autocmd!
  autocmd VimEnter  * call tabline#update(0)
  autocmd TabEnter  * call tabline#update(0)
  autocmd BufAdd    * call tabline#update(0)
  autocmd BufDelete * call tabline#update(str2nr(expand('<abuf>')))
augroup END

let s:dirsep = fnamemodify(getcwd(),':p')[-1:]
let s:centerbuf = winbufnr(0)

function! tabline#user_buffers() " help buffers are always unlisted, but quickfix buffers are not
  return filter(range(1,bufnr('$')),'buflisted(v:val)')
endfunction

function! tabline#get_centerbuf_and_tabs()
  let bufnums = tabline#user_buffers()
  let centerbuf = s:centerbuf
  let tabs = []
  let path_tabs = []
  let tabs_per_tail = {}
  let currentbuf = winbufnr(0)
  let screen_num = 0

  for bufnum in bufnums
    let screen_num += 1
    let tab = { 'num': bufnum }
    let tab.hilite = currentbuf == bufnum ? 'Active' : 'Current'
    if currentbuf == bufnum | let [centerbuf, s:centerbuf] = [bufnum, bufnum] | endif
    let bufpath = bufname(bufnum)
    if strlen(bufpath)
      let tab.path = fnamemodify(bufpath, ':p:~:.')
      let tab.sep = strridx(tab.path, s:dirsep, strlen(tab.path) - 2) " keep trailing dirsep
      if isdirectory(bufpath)
        let tab.pre = screen_num . ':'
        let tab.label = '[' . fnamemodify(bufpath, ':~:.') . ']'
      else
        let tab.label = '[' . tab.path[tab.sep + 1:] . ']'
        let tab.pre = screen_num . ':'
        let tab.post = ( getbufvar(bufnum, '&mod') ? ' [+]' : '' )
      endif
      let tabs_per_tail[tab.label] = get(tabs_per_tail, tab.label, 0) + 1
      let path_tabs += [tab]
    elseif -1 < index(['nofile','acwrite'], getbufvar(bufnum, '&buftype')) " scratch buffer
      let tab.label = '!' . screen_num
    else " unnamed file
      let tab.label = ( getbufvar(bufnum, '&mod') ? '+' : '' ) . screen_num
    endif
    let tabs += [tab]
  endfor

  " disambiguate same-basename files by adding trailing path segments
  while len(filter(tabs_per_tail, 'v:val > 1'))
    let [ambiguous, tabs_per_tail] = [tabs_per_tail, {}]
    for tab in path_tabs
      if -1 < tab.sep && has_key(ambiguous, tab.label)
        let tab.sep = strridx(tab.path, s:dirsep, tab.sep - 1)
        let tab.label = tab.path[tab.sep + 1:]
      endif
      let tabs_per_tail[tab.label] = get(tabs_per_tail, tab.label, 0) + 1
    endfor
  endwhile

  return [centerbuf, tabs]
endfunction

function! tabline#center_buffer(centerbuf, tabs)
  let centerbuf = a:centerbuf
  let tabs = a:tabs

  " 1. setup
  let lft = { 'lasttab':  0, 'cut':  '.', 'indicator': '<', 'width': 0, 'half': &columns / 2 }
  let rgt = { 'lasttab': -1, 'cut': '.$', 'indicator': '>', 'width': 0, 'half': &columns - lft.half }

  " 2. sum the string lengths for the left and right halves
  let currentside = lft
  for tab in tabs
    let tab.label = ' ' . get(tab, 'pre', '') . tab.label . get(tab, 'post', '') . ' '
    let tab.width = strwidth(strtrans(tab.label))
    if centerbuf == tab.num
      let halfwidth = tab.width / 2
      let lft.width += halfwidth
      let rgt.width += tab.width - halfwidth
      let currentside = rgt
      continue
    endif
    let currentside.width += tab.width
  endfor
  if currentside is lft " centered buffer not seen?
    " then blame any overflow on the right side, to protect the left
    let [lft.width, rgt.width] = [0, lft.width]
  endif

  " 3. toss away tabs and pieces until all fits:
  if ( lft.width + rgt.width ) > &columns
    let oversized
          \ = lft.width < lft.half ? [ [ rgt, &columns - lft.width ] ]
          \ : rgt.width < rgt.half ? [ [ lft, &columns - rgt.width ] ]
          \ :                        [ [ lft, lft.half ], [ rgt, rgt.half ] ]
    for [side, budget] in oversized
      let delta = side.width - budget
      " toss entire tabs to close the distance
      while delta >= tabs[side.lasttab].width
        let delta -= remove(tabs, side.lasttab).width
      endwhile
      " then snip at the last one to make it fit
      let endtab = tabs[side.lasttab]
      while delta > ( endtab.width - strwidth(strtrans(endtab.label)) )
        let endtab.label = substitute(endtab.label, side.cut, '', '')
      endwhile
      let endtab.label = substitute(endtab.label, side.cut, side.indicator, '')
    endfor
  endif

  if len(tabs) | let tabs[0].label = substitute(tabs[0].label, ' ', ' ', '') | endif

  return tabs
endfunction

function! tabline#render()
  let [centerbuf, tabs] = tabline#get_centerbuf_and_tabs()
  let tabs = tabline#center_buffer(centerbuf, tabs)
  let swallowclicks = '%'.(1 + tabpagenr('$')).'X'
  return swallowclicks . join(map(tabs,'printf("%%#BufTabLine%s#%s",v:val.hilite,strtrans(v:val.label))'),'') . '%#BufTabLineFill#'
endfunction

function! tabline#update(zombie)
  set tabline=
  if tabpagenr('$') > 1 | set guioptions+=e showtabline=2 | return | endif
  set guioptions-=e
  set showtabline=2
  set tabline=%!tabline#render()
endfunction
