
" `pip install sqlformat` to use.
nnoremap <buffer> <leader>ft :%!sqlformat --reindent --keywords upper --identifiers lower -<CR>
