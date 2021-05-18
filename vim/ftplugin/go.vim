"==============================
" PLUGINS
"==============================

"==============================
" ale
"==============================
" Check go files with gofmt and golint.
let b:ale_linters = ['gofmt', 'golint', 'go vet']
" Fix go files
let b:ale_fixers = ['gofmt', 'golint', 'go vet']

let b:ale_go_gofmt_options = 'goimports'
