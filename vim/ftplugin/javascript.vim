
" Only lint JS with Eslint to avoid running unnecessary linters and getting
" misleading errors.
let b:ale_linters = ['eslint']

" XXX Use this instead?: Could then remove vim-prettier plugin, but can't then
" have Prettier formatting toggleable (or maybe could find a way?)
" " Format JS with Prettier, then just lint with Eslint (to avoid running
" " unnecessary linters and getting misleading errors).
" let b:ale_linters = ['prettier', 'eslint']

" Have eslint ignore current line.
" XXX need both maps?
nnoremap <buffer> <leader>i mzO// eslint-disable-next-line<esc>`z
