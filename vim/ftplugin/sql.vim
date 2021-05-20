"==============================
" PLUGINS
"==============================

"==============================
" ale
"==============================
let b:ale_linters = ['sqllint']
let b:ale_fixers = ['sqlformat']

" run sqlformat -h in cli to see options
let b:ale_sql_sqlformat_options = '--keywords upper --use_space_around_operators --indent_after_first'
