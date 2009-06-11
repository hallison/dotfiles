" Vim syntax file
" Language:     RD
" Maintainer:   UECHI Yasumasa <uh@u.dhis.portside.net>
" Last Change:  $Date: 2003/02/12 02:17:25 $

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn match rdHeadline1 "^=\s\+.*"
syn match rdHeadline2 "^==\s\+.*"
syn match rdHeadline3 "^===\s\+.*"
syn match rdHeadline4 "^====\s\+.*"
syn match rdHeadline5 "^+\s\+.*"
syn match rdHeadline6 "^++\s\+.*"
syn match rdInline "(([*{|%:<-\'].\+[\'->:%|}*]))"

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_rd_syntax_inits")
  if version < 508
    let did_rd_syntax_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink rdHeadline1	Constant
  HiLink rdHeadline2	PreProc
  HiLink rdHeadline3	Type
  HiLink rdHeadline4	Identifier
  HiLink rdHeadline5	Statement
  HiLink rdHeadline6	Statement
  HiLink rdInline	Comment

  delcommand HiLink
endif

let b:current_syntax = "rd"
