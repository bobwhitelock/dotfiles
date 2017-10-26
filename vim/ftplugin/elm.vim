
" Log current word on line below/above, defining new `let` block for this.
nnoremap <buffer> gl mz"zyiwolet logDefinition = Debug.log "<C-r>z" <C-r>z in<esc>`z
nnoremap <buffer> gL mz"zyiwOlet logDefinition = Debug.log "<C-r>z" <C-r>z in<esc>`z

" As above, but without defining a new `let` block; assumes a `let` block
" already encloses cursor.
nnoremap <buffer> <leader>gl mz"zyiwologDefinition = Debug.log "<C-r>z" <C-r>z<esc>`z
nnoremap <buffer> <leader>gL mz"zyiwOlogDefinition = Debug.log "<C-r>z" <C-r>z<esc>`z

" Map to look up docs consistent with devdocs.io map in Vimrc.
nmap <buffer> gK <Plug>(elm-browse-docs)

nmap <buffer> <leader>sd <Plug>(elm-show-docs)
nmap <buffer> <leader>em <Plug>(elm-make)
nmap <buffer> <leader>eM <Plug>(elm-make-main)
