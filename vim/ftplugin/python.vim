
augroup global_python_autocmds
  autocmd!

  " As soon as any Python buffer has been loaded, treat any new HTML/text
  " buffer as a Django template (a hacky way to handle this, that won't work
  " if ever dealing with both HTML/text and Python in a single Vim instance
  " outside of a Django environment).
  autocmd BufNewFile,BufRead *.html set filetype=htmldjango
  autocmd BufNewFile,BufRead *.txt set filetype=django
augroup END

nnoremap <buffer> <leader>tF :call RunTests('TestFile --failfast')<CR>

" This is not a buffer-specific mapping, so that once any Python has been
" opened this will be available in any buffer.
nnoremap <leader>ep :edit platformweb/environment.properties<CR>

" nnoremap <buffer> <C-i> mz:%!isort --atomic -<CR>:w<CR>`z

" 'Go Ignore' - have mypy ignore current line.
nnoremap <buffer> gi mzA  # type: ignore<Esc>`z:write<CR>

" 'Go Noqa' - add `noqa` comment to current line.
nnoremap <buffer> gn mzA  # noqa<Esc>`z:write<CR>

" Copy dotted path of current Python module (e.g. so can be passed to a test
" runner).
nnoremap <buffer> <leader>cm :let @+ = CurrentPythonModulePath()<CR>:echo "copied module name!"<CR>

function! CurrentPythonModulePath()
  let current_path = expand('%:p')
  let git_root_path = system("git rev-parse --show-toplevel | tr -d '\\n'")
  let path_relative_to_root = trim(substitute(
        \ l:current_path, l:git_root_path, '', 'g'
        \ ), '/')
  let path_without_extension = substitute(
        \ l:path_relative_to_root, '.py$', '', ''
        \ )
  let dotted_path = substitute(l:path_without_extension, '/', '.', 'g')
  return l:dotted_path
endfunction
