setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal wrapmargin=0
setlocal textwidth=0

function! Customize()
    let @a = expand('%:r')
    %s/Filename/\=@a/
    let @a = ''
endfunction

if line('$') == 1 && getline(1) == ''
    call setline(1,readfile(glob("~/.vim/fttemplates/template.py")))
    silent! call Customize()
endif
