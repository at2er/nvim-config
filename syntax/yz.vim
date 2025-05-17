syn keyword yzKeyword and
syn keyword yzKeyword cond const
syn keyword yzKeyword elif else
syn keyword yzKeyword fn for from
syn keyword yzKeyword if import in
syn keyword yzKeyword let
syn keyword yzKeyword module mut
syn keyword yzKeyword or
syn keyword yzKeyword ret
syn keyword yzKeyword struct
syn keyword yzKeyword while

syn keyword yzType i8 i16 i32 i64 u8 u16 u32 u64 char
syn keyword yzTodo contained TODO
syn match   yzComment /;.*/ contains=yzTodo
syn match   yzDecorator /@.*/ contains=yzComment
syn match   yzNumber /\<[0-9]\+\>/
" syn match   yzFunction /.*/
syn region  yzCharacter start=/'/ end=/'/
syn region  yzString start=/"/ end=/"/

hi def link yzCharacter Character
hi def link yzComment Comment
hi def link yzDecorator PreProc
" hi def link yzFunction Function
hi def link yzKeyword Keyword
hi def link yzNumber Number
hi def link yzString String
hi def link yzTodo Todo
hi def link yzType Type

let b:current_syntax = "yz"
