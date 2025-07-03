
" Have eslint ignore current line.
" XXX Duplicated from `vim/ftplugin/javascript.vim`.
nnoremap <buffer> <leader>i mzO// eslint-disable-next-line<esc>`z

" nnoremap <buffer> <leader>ft :!npx prettier --write % >/dev/null 2>&1 <CR>

" nnoremap <leader>ft :w<CR>:call system('npx prettier --write ' . shellescape(@%))<CR>:edit!<CR>
