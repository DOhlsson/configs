" nvimrc by Daniel Ohlsson

" plugin management with vim-plug
call plug#begin()

" Styling
Plug 'vim-airline/vim-airline'      " Pretty statusline
Plug 'morhetz/gruvbox'              " Gruvbox theme

" Productivity
Plug 'junegunn/fzf'                 " fuzzy search
Plug 'junegunn/fzf.vim'             " need both of these
Plug 'tpope/vim-fugitive'           " git
Plug 'easymotion/vim-easymotion'    " cool motions tool
Plug 'airblade/vim-rooter'          " git root as cwd
Plug 'neoclide/coc.nvim', {'branch': 'release'} " LSP integration

" Language specific
Plug 'rust-lang/rust.vim'           " Rust
Plug 'ron-rs/ron.vim'               " Ron
Plug 'pangloss/vim-javascript'      " JavaScript

call plug#end()

" Regular nvim settings
syntax on             " Syntax highlighting
set autoindent        " Indent newlines automatically
set cindent           " Indent c-style syntax automatically
set expandtab         " Indent tabs as spaces
set tabstop=2         " Indent with 2 spaces
set softtabstop=-1    " Indent is removed with same amount of characters as tabstop
set shiftwidth=0      " Indent with cindent the same amount of characters as tabstop
set ignorecase        " Search is not case-sensitive
set smartcase         " Search is case sensitive when searching for words with capital letters
set incsearch         " Search while typing
set hlsearch          " Search results are highlighted
set hidden            " Keep unsaved data and undo information when switching buffers
set backupcopy=yes    " Do not write new inode when saving file
set showcmd           " Show count of marked lines in bottom right
set cursorline        " Highlight the line the Cursor is on
set number            " Line numbers
set signcolumn=number " Add signs on top of number column
set linebreak         " Break long lines by word-boundaries instead of in the middle of word
set scrolloff=10      " Cursor centered-ish
set wildmenu          " Better completion mode
set wildmode=full     " Complete to first word
set updatetime=300    " Wait 300 seconds for saving swap files and cursorhold autocommand
set shortmess-=S      " Display search hit count
set guifont=Hack:h10  " Font and size in GUI:s
set winwidth=999      " Current window as wide as possible
set winminwidth=30    " Window minimum width
set equalalways       " Windows are always equal in size
set eadirection=ver   " Only apply equalalways vertically (height)

" Use space as <leader> key
let mapleader=" "

" Make netrw default to tree view
let g:netrw_liststyle=3

" Make Neovide fancier
let g:neovide_cursor_vfx_mode="sonicboom"

" Check if working file is updated when entering that buffer
autocmd FocusGained,BufEnter * :silent! checktime

" Clear the jumplist once vim starts
autocmd VimEnter * clearjumps

" Filetype related indentation
autocmd FileType rust setlocal tabstop=4
autocmd FileType javascript setlocal tabstop=2
autocmd FileType python setlocal tabstop=4 noexpandtab
autocmd FileType yaml setlocal tabstop=2
autocmd FileType html setlocal tabstop=2


""" Remaps

" Remap s key as a delete without writing to cut register
noremap s "_d
noremap ss "_dd
noremap S "_D

" Remap x key so that it does not write to cut register
noremap x "_x
noremap X "_X

" Remap Y key to act as all the other capital letters
" Seriously, why is Y = yy when D = d$ and C = c$ ?!
noremap Y y$

" Use F12 to switch buffers
nnoremap <silent> <F12> :bn<CR>
nnoremap <silent> <S-F12> :bp<CR>

" Move vertically by visual line
nnoremap j gj
nnoremap k gk

" Use ctrl-k/ctrl-j as up/down
map <c-k> <c-p>
map <c-j> <c-n>
map! <c-k> <c-p>
map! <c-j> <c-n>

" Disable arrow-keys use hjkl instead
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

" Disable PageUp/PageDown use ctrl-u/ctrl-d instead
noremap <PageUp> <NOP>
noremap <PageDown> <NOP>

" Get highlighting group under cursor
map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
      \ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
      \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>


""" Plugin specific bindings

" Netrw
nmap <leader>te :Explore<CR>
nmap <leader>tr :Rexplore<CR>

" Fzf
nmap <leader>f :Files<CR>
nmap <leader>gc :Commits<CR>
nmap <leader>gf :GFiles<CR>
nmap <leader>gs :GFiles?<CR>
nmap <leader>h :History<CR>
nmap <leader>b :Buffers<CR>
nmap <leader>s :Rg<CR>

" fugitive.vim
nmap <leader>gb :Git blame<CR>
nmap <leader>gd :Gdiff<CR>

" easymotion
nmap <leader>el <Plug>(easymotion-overwin-line)
nmap <leader>ew <Plug>(easymotion-overwin-w)
nmap <leader>ef <Plug>(easymotion-overwin-f)


""" CoC bindings

" Start Coc
nmap <leader>cs :CocStart<CR>    

" Get all diagnostics of current buffer in location list
nmap <leader>cd :CocDiagnostics<CR>

" Format current buffer
nmap <leader>cf :call CocAction('format')<CR>

" Get suggestions to fix warnings and errors on current line
nmap <leader>ca <Plug>(coc-codeaction-line)

" Rename symbol under cursor
nmap <leader>cr <Plug>(coc-rename)

" Various jump-to commands
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gD <Plug>(coc-declaration)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use tab for trigger completion with characters ahead and navigate
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" End completion with CR in insert mode
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')


""" Plugin specific configuration

" Airline
let g:airline_powerline_fonts=1

" Gruvbox colorscheme
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_light='hard'

" Make fzf window open in fullscreen
let g:fzf_layout = {'window':{'width': 1,'height': 1}}

" easymotion
let g:EasyMotion_keys = 'asdghklqwertyuiopzxcvbnmfj'
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" vim-rooter
let g:rooter_patterns = ['.git']

" CoC
let g:coc_start_at_startup = v:false
