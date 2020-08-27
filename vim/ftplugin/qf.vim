
" Want to be able to map `CR`, everywhere except in quickfix buffer where it
" has a useful default binding.
nnoremap <buffer> <CR> <CR>

" Remap QFGrep mappings so these aren't a prefix of existing mappings, to
" avoid timeout delay.
nmap <buffer> <leader>gg <Plug>QFGrepG
nmap <buffer> <leader>gi <Plug>QFGrepV
