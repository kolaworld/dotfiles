set tabstop=4 " number of visual spaces per TAB in file
set softtabstop=4 " number of spaces per TAB when editing
set shiftwidth=4 " insert x spaces on TAB
set expandtab " replace tabs with white spaces

"==============================
" PLUGINS
"==============================

"==============================
" ale
"==============================
" Check Python files with flake8.
let b:ale_linters = ['flake8']
" Fix Python files with black
let b:ale_fixers = ['black', 'isort', 'yapf']
