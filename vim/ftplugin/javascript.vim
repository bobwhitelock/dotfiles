
nnoremap gl oconsole.log() // eslint-disable-line no-console<esc>F)i
nnoremap gL Oconsole.log() // eslint-disable-line no-console<esc>F)i

" Have eslint ignore current line.
nnoremap <leader>i mzA // eslint-disable-line<esc>`z`

" `eslint --fix` current file.
nnoremap <leader>f :Fixmyjs<CR>
