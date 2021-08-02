" Vim syntax file
" Language: Cheez
" Maintainer: Nimaoth
if exists("b:current_syntax")
    finish
endif

" Matches

" syn match comment '/\*.*\*/'
syn match cheezType display "\<[A-Z][a-zA-Z0-9_]*\>"
syn match cheezOperator display "\%(+\|-\|*\|/\|%\|=\|<\|>\|&\||\|\^\)=\?"
syn match cheezDelimiter display "\%(:\|,\|;\|\.\)=\?"
syn match cheezParens display "\%((\|)\|\[\|\]\|{\|}\)=\?"

" TODO: suffix
syn match cheezNumber display '\(0x[0-9a-fA-F]\+\)\|\(0b[0-1]\+\)\|\([0-9]\+\)'
syn match cheezDirective display "#[a-zA-Z0-9_]\+"
syn match cheezIntrinsic display "@[a-zA-Z0-9_]\+"
syn match cheezDollarId display "$[a-zA-Z0-9_]\+"
syn keyword cheezUnderscore _

" Keywords
syn keyword cheezKeyword struct enum trait fn Fn if else while loop for break continue match return in is and or import use pub mut impl cast
syn keyword builtinLiterals true false null default
syn keyword builtinTypes i8 i16 i32 i64 int u8 u16 u32 u64 uint char8 char16 char32 char f32 f64 float double bool string void

syn match cheezCommentLine '//.*$'
syn match cheezDocCommentLine '/// .*$'

" Regions
syn region codeBlock start='{' end='}' fold transparent
syn region groupBlock start='(' end=')' fold transparent
syn region arrayBlock start='\[' end='\]' fold transparent
syn region cheezString start=+"+ end=+"+
syn region cheezCharacter start=+'+ end=+'+
syn region cheezCommentBlock start='/\*' end='\*/' fold
syn region cheezDocCommentBlock start='///\*' end='\*/' fold

hi def link cheezKeyword Keyword
hi def link cheezUnderscore Identifier
hi def link builtinLiterals Constant
hi def link cheezNumber Constant
hi def link cheezString String
hi def link cheezCharacter   Character
hi def link bools  Constant
hi def link values Constant
hi def link cheezCommentLine Comment
hi def link cheezDocCommentLine SpecialComment
hi def link cheezCommentBlock Comment
hi def link cheezDocCommentBlock SpecialComment
hi def link cheezType Structure
hi def link cheezDirective Label
hi def link cheezIntrinsic Keyword
hi def link cheezDollarId Identifier
hi def link builtinTypes Type
hi def link cheezOperator Special
hi def link cheezDelimiter Delimiter
hi def link cheezParens Special

let b:current_syntax  = 'cheez'
