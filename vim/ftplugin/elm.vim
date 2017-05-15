
" Log current line, using first word on line above as tag; e.g. useful for
" logging let expressions. This will probably often not work.
nnoremap <buffer> gl mzk^"zyiw`zIDebug.log "<C-r>z" (<esc>A)<esc>`z

" Using xmap does funny stuff with aliases, need to work out start and end of
" selection to surround - or use vim-surround function?
" xmap gl S)k^"zyiwjIDebug.log "<C-r>z" (<esc>A)<esc>`z

nmap <buffer> <leader>sd <Plug>(elm-show-docs)
nmap <buffer> <leader>bd <Plug>(elm-browse-docs)
nmap <buffer> <leader>em <Plug>(elm-make)
nmap <buffer> <leader>eM <Plug>(elm-make-main)

" add maps to jump up to imports and add current word, one of which will stay
" to allow you to add to and one of which goes straight back
"
" alternatively/additionally - ask in elm slack about resolving dependencies
" in vim
