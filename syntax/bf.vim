" Vim syntax file
" Language:         Brainf*ck
" Maintainer:       Will Sumner
" Last Changed:     Jun 2 2017
" Remark:           Helpful for writing difficult programs

if version < 600
    syntax clear
elseif exists("b:current_syntax")
    finish
end

let s:cpo_save = &cpo
set cpo&vim

set textwidth=80
set wrapmargin=2
syntax match bfOp /[+-<>]/
syntax match bfDebug /[#*]/
syntax match bfIo /[,.]/
syntax match bfComment /[^+-<>\#\*,.\]\[]/
syntax region bfBrak1 matchgroup=bfBrak1 start=/\[/ end=/\]/ contains=bfBrak2,bfOp,bfDebug,bfIo
syntax region bfBrak2 matchgroup=bfBrak2 start=/\[/ end=/\]/ contains=bfBrak3 contained
syntax region bfBrak3 matchgroup=bfBrak3 start=/\[/ end=/\]/ contains=bfBrak1 contained

hi link bfOp        Operator
hi link bfDebug     Special
hi link bfIo        Special
hi link bfComment   Comment
hi link bfBlockEnd  Character
hi link bfBrak1     PreProc
hi link bfBrak2     Float
hi link bfBrak3     Tag

let b:current_syntax = "bf"
let &cpo = s:cpo_save
unlet s:cpo_save
