
" Log current line, using first word on line above as tag; e.g. useful for
" logging let expressions. This will probably often not work.
nnoremap <buffer> gl mzk^"zyiw`zIDebug.log "<C-r>z" (<esc>A)<esc>`z

nmap <buffer> <leader>sd <Plug>(elm-show-docs)
nmap <buffer> <leader>bd <Plug>(elm-browse-docs)
nmap <buffer> <leader>em <Plug>(elm-make)
nmap <buffer> <leader>eM <Plug>(elm-make-main)
