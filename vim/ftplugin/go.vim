setlocal foldmethod=indent
setlocal nofoldenable
"==============================
" PLUGINS
"==============================

"==============================
" ale
"==============================
let b:ale_linters = ['golangci-lint', 'go vet']
let b:ale_fixers = ['goimports', 'gofmt']
