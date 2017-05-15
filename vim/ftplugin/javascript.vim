
nnoremap <buffer> gl oconsole.log() // eslint-disable-line no-console<esc>F)i
nnoremap <buffer> gL Oconsole.log() // eslint-disable-line no-console<esc>F)i

" Add line to log current word.
nnoremap <buffer> <leader>gl mz"zyiwoconsole.log("<C-r>z:", <C-r>z) // eslint-disable-line no-console<esc>`z

" Have eslint ignore current line.
nnoremap <buffer> <leader>i mzA // eslint-disable-line<esc>`z`

" `eslint --fix` current file.
nnoremap <buffer> <leader>f :Fixmyjs<CR>
