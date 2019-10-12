"Custom Filetype File
"Written by Will Sumner
if exists("did_load_filetypes")
    finish
endif

augroup filetypedetect
    au! BufRead,BufNewFile *.bf setfiletype bf
    au! BufRead,BufNewFile *.do setfiletype msdo
augroup END
