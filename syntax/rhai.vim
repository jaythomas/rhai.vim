if exists("b:current_syntax") && b:current_syntax == "rhai"
  finish
endif

" Statements
syn keyword rhaiConditional
 \ if else
syn keyword rhaiRepeat
 \ do while loop until for in
syn keyword rhaiStatement
 \ return break continue
syn keyword rhaiKeyword
 \ this
syn keyword rhaiExceptions
 \ throw try catch

syn keyword rhaiKeyword
 \ fn
 \ nextgroup=rhaiFuncName
 \ skipwhite skipempty
syn match   rhaiFuncName
 \ "\%(r#\)\=\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\)\%([^[:cntrl:][:punct:][:space:]]\|_\)*"
 \ display contained

" Qualifiers
syn keyword rhaiQualifier
 \ const let

" Access
syn keyword rhaiAccess
 \ private

" Module
syn keyword rhaiModule
 \ import export as

" Boolean
syn keyword rhaiBoolean
 \ true false

" Reserved
syn keyword rhaiReserved
 \ var static is goto exit switch
 \ match case public protected new use with module package super
 \ spawn thread go sync async await yield
 \ default void null nil

" Operators
syn match rhaiOperator
 \ display
 \ "\%(+\|-\|/\|*\|=\|\^\|&\||\|!\|>\|<\|%\)=\?"

" String
syn match rhaiEscapeError
 \ display contained
 \ /\\./
syn match rhaiEscape
 \ display contained
 \ /\\\([nrt0\\'"]\|x\x\{2}\)/
syn match rhaiEscapeUnicode
 \ display contained
 \ /\\u{\%(\x_*\)\{1,6}}/
syn region rhaiString
 \ matchgroup=rhaiStringDelimiter
 \ start=+"+
 \ skip=+\\\\\|\\"+
 \ end=+"+
 \ contains=rhaiEscape,rhaiEscapeUnicode,rhaiEscapeError,@Spell


" Number literals
syn match rhaiDecNumber
 \ display
 \ "\<[0-9][0-9_]*\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match rhaiHexNumber
 \ display
 \ "\<0x[a-fA-F0-9_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match rhaiOctNumber
 \ display
 \ "\<0o[0-7_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="
syn match rhaiBinNumber
 \ display
 \ "\<0b[01_]\+\%([iu]\%(size\|8\|16\|32\|64\|128\)\)\="

syn match rhaiFloat
 \ display
 \ "\<[0-9][0-9_]*\.\%([^[:cntrl:][:space:][:punct:][:digit:]]\|_\|\.\)\@!"
syn match rhaiFloat
 \ display
 \ "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)\="
syn match rhaiFloat
 \ display
 \ "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\(f32\|f64\)\="
syn match rhaiFloat
 \ display
 \ "\<[0-9][0-9_]*\%(\.[0-9][0-9_]*\)\=\%([eE][+-]\=[0-9_]\+\)\=\(f32\|f64\)"

" Built-in Functions
syn keyword rhaiBuiltinFunction
 \ print type_of debug eval is_def_fn call curry is_shared is_def_var

" Comments
syn keyword rhaiTodo
 \ contained
 \ TODO FIXME XXX NB NOTE SAFETY
syn match rhaiCommentLine
 \ '//.*$'
 \ contains=rhaiTodo,@Spell
syn region rhaiCommentBlock
 \ matchgroup=rhaiCommentBlock
 \ start="/\*\%(!\|\*[*/]\@!\)\@!"
 \ end="\*/"
 \ contains=rhaiTodo,rhaiCommentBlockNest,@Spell
syn region rhaiCommentBlockNest
 \ matchgroup=rhaiCommentBlock
 \ start="/\*"
 \ end="\*/"
 \ contains=rhaiTodo,rhaiCommentBlockNest,@Spell
 \ contained transparent


hi def link rhaiDecNumber             rhaiNumber
hi def link rhaiHexNumber             rhaiNumber
hi def link rhaiOctNumber             rhaiNumber
hi def link rhaiBinNumber             rhaiNumber
hi def link rhaiNumber                Number
hi def link rhaiFloat                 Float
hi def link rhaiConditional           Conditional
hi def link rhaiQualifier             Type
hi def link rhaiRepeat                Repeat
hi def link rhaiStatement             Statement
hi def link rhaiTodo                  Todo
hi def link rhaiExceptions            Exception
hi def link rhaiReserved              Error
hi def link rhaiEscapeError           Error
hi def link rhaiString                String
hi def link rhaiStringDelimiter       String
hi def link rhaiOperator              Operator
hi def link rhaiModule                Include
hi def link rhaiBuiltinFunction       Function
hi def link rhaiOperator              Operator
hi def link rhaiBoolean               Boolean
hi def link rhaiKeyword               Keyword
hi def link rhaiFuncName              Keyword
hi def link rhaiCommentLine           Comment
hi def link rhaiCommentBlock          Comment
hi def link rhaiCommentBlockNest      Comment

if !exists("b:current_syntax")
  let b:current_syntax = "rhai"
endif
