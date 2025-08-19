if exists("b:current_syntax")
  finish
endif
let s:cpo_save = &cpo
set cpo&vim

syn keyword yzKeyword and
syn keyword yzKeyword const
syn keyword yzKeyword enum
syn keyword yzKeyword for from
syn keyword yzKeyword import in
syn keyword yzKeyword null
syn keyword yzKeyword or
syn keyword yzKeyword pub
syn keyword yzKeyword ret
syn keyword yzKeyword struct
syn keyword yzKeyword while

" Conditional
syn keyword yzConditional cond elif else if

" Function
syn keyword yzKeyword fn nextgroup=yzKeywordRec,yzFunction skipwhite
syn keyword yzKeywordRec rec contained nextgroup=yzFunction,yzModule skipwhite
syn match   yzFunction /\h\w*/ contained nextgroup=yzFunctionArgs skipwhite
syn region  yzFunctionArgs start=/(/ end=/)/ contains=ALL

" Let
syn keyword yzKeywordMut mut
syn keyword yzKeywordLet let nextgroup=yzKeywordMut,yzIdentifier skipwhite
syn match   yzIdentifier /\h\w*/ contained

" Module
syn keyword yzKeyword mod nextgroup=yzKeywordRec,yzModule skipwhite
syn match   yzModule /\h\w*/ contained

syn keyword yzType i8 i16 i32 i64 u8 u16 u32 u64 char

" Comment
syn keyword yzTodo TODO contained
syn match   yzComment /;.*/ contains=yzTodo

" Decorators
syn match   yzDecorator /@.*/

syn match   yzNumber /\<[0-9]\+\>/
syn region  yzCharacter start=/'/ skip=/\\"/ end=/'/
syn region  yzString start=/"/ skip=/\\"/ end=/"/

hi def link yzCharacter   Character
hi def link yzConditional Conditional
hi def link yzComment     Comment
hi def link yzDecorator   PreProc
hi def link yzFunction    Function
hi def link yzFunctionArg Identifier
hi def link yzIdentifier  Identifier
hi def link yzKeyword     Keyword
hi def link yzKeywordLet  yzKeyword
hi def link yzKeywordMut  yzKeyword
hi def link yzKeywordRec  yzKeyword
hi def link yzModule      Special
hi def link yzNumber      Number
hi def link yzString      String
hi def link yzTodo        Todo
hi def link yzType        Type

let b:current_syntax = "yz"
