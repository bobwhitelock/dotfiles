
augroup global_python_autocmds
  autocmd!

  " As soon as any Python buffer has been loaded, treat any new HTML/text
  " buffer as a Django template (a hacky way to handle this, that won't work
  " if ever dealing with both HTML/text and Python in a single Vim instance
  " outside of a Django environment).
  autocmd BufNewFile,BufRead *.html set filetype=htmldjango
  autocmd BufNewFile,BufRead *.txt set filetype=django
augroup END

nnoremap <buffer> <leader>tF :CrTdd<CR>:TestFile --failfast<CR>

" This is not a buffer-specific mapping, so that once any Python has been
" opened this will be available in any buffer.
nnoremap <leader>ep :edit platformweb/environment.properties<CR>

" nnoremap <buffer> <C-i> mz:%!isort --atomic -<CR>:w<CR>`z
