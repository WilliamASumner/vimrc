" Vim syntax file
" Language:         ModelSim Do Files
" Maintainer:       Will Sumner
" Last Changed:     Sep 4 2019
" Remark:           Helpful for writing scripts

if exists('b:current_syntax')
    finish
endif

syn clear
" syn case ignore
"mSDFile => modelSimDoFile
syn match msdFileComment "^--.*$" display
syn match msdDec         "\d\+" contained display



syn match msdHexVal      'X\"\x\+\"' contained display
"syn match msdOctVal      'O\'' display
syn match msdBinVal      '2\'b[0|1]\+' contained display
syn match msdIdentifier  '\w\+' contained display nextgroup=msdHexVal,msdBinVal skipwhite

syn region msdRunCommand     start="^run" end="$" contains=msdFileKeyword,msdDec oneline
syn region msdForceCommand   start="^force" end="$" contains=msdFileKeyword,msdDec,msdHexVal,msdBinVal oneline
syn region msdRestartCommand start="^restart" end="$" contains=msdArg,msdFileKeyword oneline

syn match msdFileScript  "[A-Z]:\(\/\S\+\)\+\/\="
syn match msdArg         "-[a-z|A-Z]\+" display

syn keyword msdFileKeyword restart nextgroup=msdArg skipwhite
syn keyword msdFileKeyword run nextgroup=msdDec skipwhite
syn keyword msdFileKeyword force nextgroup=msdIdentifier skipwhite

hi def link msdFileComment     Comment
hi def link msdRunCommand      Comment
hi def link msdForceCommand    Comment
hi def link msdRestartCommand  Comment
hi def link msdArg             Type
hi def link msdDec             Special
hi def link msdHexVal          Constant
"hi def link msdOctVal          Keyword
hi def link msdBinVal          Float
hi def link msdIdentifier      Identifier
hi def link msdFileKeyword     Keyword
hi def link msdFileScript      Identifier
hi def link msdFileString      Identifier

let b:current_syntax = 'modelSimDoFile'
