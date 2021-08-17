
" Convert word to inline code.
Repeatable nmap <buffer> <leader>` ysiw`ysi``

" Bold word.
Repeatable nmap <buffer> <leader>* ysiw*ysi**

" Create different levels of title.
Repeatable nmap <buffer> <leader># :Underline #<CR>yykP
Repeatable nmap <buffer> <leader>= :Underline =<CR>
Repeatable nmap <buffer> <leader>- :Underline -<CR>

" This is not a buffer-specific mapping, so that once any reST file has been
" opened this will be available in any buffer.
nnoremap <leader>et :edit content/_toc.yml<CR>
