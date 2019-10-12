setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab

function! Customize()
    let @a = toupper(expand('%:r'))
    %s/Filename/\=@a/
    let @a = ''
endfunction


if line('$') == 1 && getline(1) == ''
    if expand('%:e') =~? '\v^h%(pp|h|\+\+|xx)?$' " if a header file
        call setline(1,readfile(glob("~/.vim/fttemplates/template.h")))
        silent! call Customize()
else " else a C file
        call setline(1,readfile(glob("~/.vim/fttemplates/template.c")))
    endif
endif
