set wm=0
set tw=0
setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab

if line('$') == 1 && getline(1) == ''
    call setline(1,readfile(glob("~/.vim/fttemplates/template.sh")))
endif
