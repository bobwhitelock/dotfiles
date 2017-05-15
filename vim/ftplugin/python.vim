
nnoremap <buffer> gl oprint()<esc>i
nnoremap <buffer> gL Oprint()<esc>i

" Add line to log current word.
nnoremap <buffer> <leader>gl mz"zyiwoprint("<C-r>z:", <C-r>z)<esc>`z
nnoremap <buffer> <leader>gL mz"zyiwOprint("<C-r>z:", <C-r>z)<esc>`z
