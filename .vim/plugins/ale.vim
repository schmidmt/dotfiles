let g:ale_completion_enabled = 0
let g:ale_disable_lsp = 1

Plug 'dense-analysis/ale'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}
let g:ale_fix_on_save = 1
let g:ale_rust_cargo_use_clippy = 1
let g:ale_rust_cargo_check_tests = 1
