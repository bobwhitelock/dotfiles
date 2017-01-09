
nnoremap gl oecho "${}"<esc>F}i
nnoremap gL Oecho "${}"<esc>F}i

" Add line to log current word.
nnoremap <leader>gl mz"zyiwoecho <C-r>z: "${<C-r>z}"<esc>`z

" Open the ShellCheck wiki page for the error detected on the current line, as
" reported by Syntastic.
function! ShowShellcheckWikiPage()
  let l:error_regex = line('.') . ' col'

  Errors
  lopen

  if search(l:error_regex)
    normal! $b"zyiw
    execute '!xdg-open https://github.com/koalaman/shellcheck/wiki/' . @z
    lclose
  else
    lclose
    echom 'No ShellCheck issue on current line.'
  endif
endfunction
nnoremap <silent> <leader>sc :call ShowShellcheckWikiPage()<CR>

" Add a line above the current line to disable the current Shellcheck issue,
" if any.
function! DisableShellcheckIssue()
  let l:error_regex = line('.') . ' col'

  Errors
  lopen

  if search(l:error_regex)
    normal! $b"zyiw
    lclose
    execute 'normal! mzO# shellcheck disable=' . @z . "\<esc>`z"
  else
    lclose
    echom 'No ShellCheck issue on current line.'
  endif
endfunction
nnoremap <silent> <leader>sd :call DisableShellcheckIssue()<CR>
