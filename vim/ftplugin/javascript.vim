
" Only lint JS with Eslint to avoid running unnecessary linters and getting
" misleading errors.
let b:ale_linters = ['eslint']

" Have eslint ignore current line.
nnoremap <buffer> <leader>i mzA // eslint-disable-line<esc>`z`

" `eslint --fix` current file.
nnoremap <buffer> <leader>f :Fixmyjs<CR>
