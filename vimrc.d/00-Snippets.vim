" Snippets

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
