
" Last change:  Wed Oct  12 11:46:53 EDT 2019

" Startup Pathogen
execute pathogen#infect()
Helptags "generate docs for everyone

" Syntastic settings

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height=3
let g:syntastic_html_tidy_ignore_errors=[
    \'proprietary attribute "download',
    \'missing </a> before <div>',
    \'discarding unexpected </a>'
\]
packadd! matchit

" Setup Airline
set noshowmode "configure vim to not show the regular status bar
set laststatus=2
set t_Co=256
set ttimeoutlen=10
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'


"Gutentags settings
set statusline+=%{gutentags#statusline()}

let g:gitroot = substitute(system('git rev-parse --show-toplevel'), '[\n\r]', '', 'g') " find the toplevel of this dir
if g:gitroot !=# '' " if not empty
  let g:gutentags_cache_dir = g:gitroot .'/.git/' " start-er up
else
  let g:guten_tags_dont_load = 1 " otherwise don't load it
endif

" Use the bubblegum color scheme
set background=dark " set the background to white
colorscheme bubblegum-256-dark
" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

set nomodeline
" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
if &compatible
    set nocompatible
endif

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set backup        " keep a backup file (restore to previous version)
set undofile        " keep an undo file (undo changes after closing)
set history=50        " keep 50 lines of command line history
function CleanUp ()
    let v:errmsg = ""
    %s/\r/\r/g
    %s/\s\+$//
    retab
    execute "normal! gg=G''"
    set ff=unix
endfunction
"nnoremap <C-P> :silent! call CleanUp()<CR>

" Custom Options I've Changed
set backupdir^=/tmp
set ruler        " show the cursor position all the time
set showcmd        " display incomplete commands
set incsearch        " do incremental searching
set ignorecase
set smartcase
set relativenumber " set linenumbers to relative from the current one
set number  " does the cool job of setting the current linenumber to actual one
set cryptmethod=blowfish2
set wildmode=longest,list,full
set wildmenu
set wildignorecase
set splitbelow
set splitright
let $BASH_ENV = "~/.bash_aliases" " for expanding aliases
"let g:syntastic_ignore_files = ['\.html$','\.css$','\.js$']
" Change cursor shape between insert and normal mode in iTerm2.app
"let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
"let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"nnoremap <C-]> :ptj<CR>
set tags=./tags,./*/tags

"nnoremap ;s :set spell spelllang=en_us,de

nnoremap + :bn<CR>
nnoremap - :bp<CR>
setlocal wrapmargin=2
setlocal shiftwidth=4
setlocal listchars=eol:¬,tab:>- " Setting the list chars in case they're needed
set list
setlocal expandtab " so that tabs won't show up
setlocal tabstop=4

command W w
" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Change the settings for highlighting to make it prettier/easier to use
highlight Search ctermbg=235 ctermfg=yellow cterm=underline
highlight IncSearch ctermbg=235 ctermfg=yellow cterm=underline

" Code folding for vim!
set foldmethod=syntax
set foldnestmax=10
set nofoldenable
set foldlevel=2

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on
    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
    au!

    autocmd Filetype python nnoremap <F5> <Esc>:w<CR>:!clear;python3 %<CR>

    " For all text files set 'word margin' to 10 characters.
    setlocal wrap linebreak
    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    autocmd BufReadPost *
    \ if line("'\"") >= 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

    autocmd Filetype java set makeprg=javac\ %
    set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#

    augroup END


else
    set autoindent        " always set autoindenting on
endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis | wincmd p | diffthis
endif

if has('langmap') && exists('+langnoremap')
    " Prevent that the langmap option applies to characters that result from a
    " mapping.  If unset (default), this may break plugins (but it's backward compatible).
    set langnoremap
endif
