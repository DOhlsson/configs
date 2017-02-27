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
hi Comment ctermfg=4
hi Todo cterm=bold ctermfg=4 ctermbg=None
hi Number ctermfg=77
hi link javaScriptValue Number
" vim: sw=2