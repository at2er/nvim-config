syn keyword atomKeyword func return ret while for in module import from
syn keyword atomType i8 i16 i32 i64 u8 u16 u32 u64
syn keyword atomTodo contained TODO
syn match   atomComment /;.*/ contains=atomTodo
syn region  atomCharacter start=/'/ end=/'/
syn region  atomString start=/"/ end=/"/

hi def link atomCharacter Character
hi def link atomComment Comment
hi def link atomKeyword Keyword
hi def link atomString String
hi def link atomTodo Todo
hi def link atomType Type

let b:current_syntax = "yz"
