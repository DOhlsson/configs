" Vim color file

" My changes to the default colorscheme
" designed to work in xterm-256color

hi clear Normal
set bg&

" Remove all existing highlighting and set the defaults.
hi clear

" Load the syntax highlighting defaults, if it's enabled.
if exists("syntax_on")
  syntax reset
endif

let colors_name = "mycolors"

hi Search ctermfg=0 ctermbg=3
hi DiffChange ctermbg=5
hi Comment ctermfg=4
hi Todo cterm=bold ctermfg=4 ctermbg=None
hi Number ctermfg=82
hi Visual cterm=reverse ctermbg=None
hi String cterm=bold ctermfg=1
hi link Character String
hi Identifier ctermfg=6
hi Type ctermfg=6
hi Statement ctermfg=3
hi CursorLine cterm=NONE ctermbg=232
hi CursorColumn cterm=NONE ctermbg=232

hi link javaScriptValue Number
hi jsObjectKey ctermfg=5
hi jsGlobalObjects ctermfg=15
hi jsGlobalNodeObjects ctermfg=15
" vim: sw=2
