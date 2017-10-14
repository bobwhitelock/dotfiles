
" Log current word on line above, defining new `let` block for this.
nnoremap <buffer> gL mz"zyiwOlet logDefinition = Debug.log "<C-r>z" <C-r>z in<esc>`z

" As above, but without defining a new `let` block; assumes a `let` block
" already encloses cursor.
nnoremap <buffer> <leader>gL mz"zyiwOlogDefinition = Debug.log "<C-r>z" <C-r>z<esc>`z

nmap <buffer> <leader>sd <Plug>(elm-show-docs)
nmap <buffer> <leader>bd <Plug>(elm-browse-docs)
nmap <buffer> <leader>em <Plug>(elm-make)
nmap <buffer> <leader>eM <Plug>(elm-make-main)
