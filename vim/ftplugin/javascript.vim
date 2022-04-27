
" Only lint JS with Eslint to avoid running unnecessary linters and getting
" misleading errors.
" XXX Disabled even Eslint, can't remember why
let b:ale_linters = []

" Have eslint ignore current line.
nnoremap <buffer> <leader>i mzO// eslint-disable-next-line<esc>`z
