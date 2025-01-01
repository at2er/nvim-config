syn keyword yzKeyword const fn ret ref while for in mut module import from
syn keyword yzType i8 i16 i32 i64 u8 u16 u32 u64 char
syn keyword yzTodo contained TODO
syn match   yzComment /;.*/ contains=yzTodo
syn match   yzDecorator /@.*/ contains=yzComment
syn region  yzCharacter start=/'/ end=/'/
syn region  yzString start=/"/ end=/"/

hi def link yzCharacter Character
hi def link yzComment Comment
hi def link yzDecorator PreProc
hi def link yzKeyword Keyword
hi def link yzString String
hi def link yzTodo Todo
hi def link yzType Type

let b:current_syntax = "yz"
