setlocal softtabstop=4
setlocal tabstop=4
setlocal shiftwidth=4
setlocal smarttab
setlocal expandtab
setlocal wrap
setlocal wrapmargin=0
setlocal textwidth=0

if line('$') == 1 && getline(1) == ''
    call setline(1,readfile(glob("~/.vim/fttemplates/template.html")))
endif
