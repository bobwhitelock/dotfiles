
" Log current line, using first word on line above as tag; e.g. useful for
" logging let expressions. This will probably often not work.
nnoremap gl mzk^"zyiw`zIDebug.log "<C-r>z" (<esc>A)<esc>`z

nmap <leader>sd <Plug>(elm-show-docs)
nmap <leader>bd <Plug>(elm-browse-docs)
nmap <leader>em <Plug>(elm-make)
nmap <leader>eM <Plug>(elm-make-main)
