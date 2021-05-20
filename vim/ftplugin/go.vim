"==============================
" PLUGINS
"==============================

"==============================
" ale
"==============================
let b:ale_linters = ['golangci-lint', 'go vet']
let b:ale_fixers = ['goimports']
let b:ale_go_golangci_lint_options = "-enable=bodyclose,exhaustive,rowserrcheck --disable=errcheck"
