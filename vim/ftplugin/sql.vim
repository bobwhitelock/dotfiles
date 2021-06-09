
" `pip install sqlparse` to use.
" XXX Make this just format selected area? Or find better formatter?
nnoremap <buffer> <leader>ft mz:%!sqlformat --reindent --keywords upper --identifiers lower -<CR>`z
