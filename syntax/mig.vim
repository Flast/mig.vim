" Vim syntax file
"
" Language:     MIG
" Maintainer:   Kohei Takahashi <flast@flast.jp>
" URL:          https://github.com/Flast/mig.vim

" Remove any old syntax stuff hanging around
if version < 600
  sy clear
elseif exists("b:current_syntax")
  finish
endif

sy region   migIncluded     display contained start=+"+ skip=+\\\\\|\\"+ end=+"+
sy match    migIncluded     display contained "<[^>]*>"
sy match    migInclude      display "^\s*\(%:\|#\)\s*include\>\s*["<]" contains=migIncluded
sy match    migInclude      display "\<[us]\?import\>\s*["<]" contains=migIncluded

sy region   migPreCond      start="^\s*\(%:\|#\)\s*\(if\|ifdef\|ifndef\|elif\)\>" skip="\\$" end="$" keepend
sy match    migPreCondMatch display "^\s*\(%:\|#\)\s*\(else\|endif\)\>"

sy keyword  migSubsystem    subsystem

sy keyword  migRoutine      skip
sy keyword  migRoutine      routine simpleroutine
sy keyword  migRoutine      proceduer simpleprocedure function

sy keyword  migType         type
sy keyword  migStructure    struct array of

sy region   migComment      matchgroup=migCommentStart start="/\*" end="\*/"
sy keyword  migTodo         TODO FIXME XXX

if !exists("did_migstyle_syntax_inits")
    let did_migstyle_syntax_inits = 1

    hi link migIncluded     String
    hi link migInclude      Include
    hi link migPreCondMatch migPreCond
    hi link migPreCond      PreCondit

    hi link migSubsystem    Identifier

    hi link migRoutine      Keyword

    hi link migType         Structure
    hi link migStructure    Structure

    hi link migCommentStart Comment
    hi link migComment      Comment
    hi link migTodo         Todo
endif

let b:current_syntax = "mig"
