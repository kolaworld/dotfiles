"==============================
" DEFAULTS
"==============================
set nocompatible " use Vim settings, rather than Vi settings
filetype plugin indent on
set history=2000 " keep x lines of command line history
set timeout	" time out for and mappings key codes
set timeoutlen=500
set ttimeoutlen=100	" wait up to 100ms after Esc for special key
set nrformats-=octal " Do not recognize octal numbers for Ctrl-A and Ctrl-X
set mouse+=a " enable mouse mode (scrolling, selection, etc)
set backup " Save backup files
set backupdir=~/.vim/tmp/backup//,.
set swapfile " Save swap files
set directory=~/.vim/tmp/swap//,.
set undofile " Save undo files
set undodir=~/.vim/tmp/undo//,.
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=100
"==============================
" NO OPERATION | LEADER
"==============================
" 'Q' in normal mode enters Ex mode.
nmap Q <Nop>
" remap leader to space
nnoremap <SPACE> <Nop>
let mapleader = ' '

"==============================
" DISPLAY | COLOR
"==============================
syntax on
set showcmd	" display incomplete commands
set scrolloff=5 " Show a few lines of context around the cursor.
set number " Show line numbers.
set laststatus=2 " Always show the status line at the bottom.
set cursorline " Highlight the current line
" set cmdheight=2 " better display for messages
set splitbelow " open new split panes to right and bottom
set signcolumn=yes " always show sign colum for gitgutter and coc
set splitright
" disable audible bell
set noerrorbells visualbell t_vb=
"==============================
" SEARCH
"==============================
set ignorecase " search case insensitive until first capital
set smartcase
set incsearch " do incremental search
set hlsearch "highlight search
command C let @/="" " Clear search
" Also clears search
noremap <silent> <C-_> :let @/ = ""<CR>
set wildmenu " Display all matching files when tab complete
set wildmode=longest:list,full "Complete longest common, then list, then tab complete list.

"==============================
" EDITING
"==============================
set hidden " allow auto-hiding of edited buffers
set autoindent " Enable auto indentation
set tabstop=4 " number of visual spaces per TAB in file
set softtabstop=4 " number of spaces per TAB when editing
set shiftwidth=4 " insert x spaces on TAB
set expandtab " replace tabs with white spaces

set backspace=indent,eol,start " backspace over everything in insert mode.

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
" Revert with ":iunmap <C-U>".
inoremap <C-U> <C-G>u<C-U>

" Copy / paste from clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p

"==============================
" MOVEMENT
"==============================

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

nnoremap <Left>  :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up>    :echoe "Use k"<CR>
nnoremap <Down>  :echoe "Use j"<CR>
" ...and in insert mode
inoremap <Left>  <ESC>:echoe "Use h"<CR>
inoremap <Right> <ESC>:echoe "Use l"<CR>
inoremap <Up>    <ESC>:echoe "Use k"<CR>
inoremap <Down>  <ESC>:echoe "Use j"<CR>

"==============================
" CURSOR
"==============================
"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar

"SI = INSERT mode
"SR = REPLACE mode
"EI = NORMAL mode (ELSE)

let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[4 q"
