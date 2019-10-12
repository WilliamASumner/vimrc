if line('$') == 1 && getline(1) == ''
    call setline(1,readfile(glob("~/.vim/fttemplates/template.perl")))
endif
