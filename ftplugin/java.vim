setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab

abbreviate print( System.out.print(
abbreviate pln System.out.println
abbreviate perr System.err.println
abbreviate prtf( System.out.printf(
abbreviate exit System.exit(0)

function! Customize()
    let @a = expand('%:r')
    %s/Filename/\=@a/
    let @a = ''
endfunction

if line('$') == 1 && getline(1) == ''
    call setline(1,readfile(glob("~/.vim/fttemplates/template.java")))
    silent! call Customize()
endif
