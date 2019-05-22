
augroup global_python_autocmds
  autocmd!

  " As soon as any Python buffer has been loaded, treat any new HTML buffer as
  " a Django template (a hacky way to handle this, that won't work if ever
  " dealing with both HTML and Python in a single Vim instance outside of a
  " Django environment).
  autocmd BufNewFile,BufRead *.html set filetype=htmldjango
augroup END

nnoremap <buffer> <leader>tF :CrTdd<CR>:TestFile --failfast<CR>
