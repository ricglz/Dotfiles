if exists("b:did_ftplugin")
    finish
endif
let b:did_ftplugin = 1

if get(b:, 'current_compiler', '') ==# ''
    if strlen(findfile('Cargo.toml', '.;')) > 0
        compiler cargo
    else
        compiler rustc
    endif
endif
setl makeprg=cargo\ clippy
setl shiftwidth=4
