
nnoremap gl oecho "${}"<esc>F}i
nnoremap gL Oecho "${}"<esc>F}i

" Add line to log current word.
nnoremap <leader>gl mz"zyiwoecho <C-r>z: "${<C-r>z}"<esc>`z

" Open the ShellCheck wiki page for the error detected on the current line, as
" reported by Syntastic.
function! ShowShellcheckWikiPage()
  let l:issue = s:LineHasShellcheckIssue()

  if l:issue == 0
    execute '!xdg-open https://github.com/koalaman/shellcheck/wiki/' . l:issue
  endif
endfunction
nnoremap <silent> <leader>sc :call ShowShellcheckWikiPage()<CR>

" Add a line above the current line to disable the current Shellcheck issue,
" if any.
function! DisableShellcheckIssue()
  let l:issue = s:LineHasShellcheckIssue()

  if l:issue == 0
    execute 'normal! mzO# shellcheck disable=' . l:issue . "\<esc>`z"
  endif
endfunction
nnoremap <silent> <leader>sd :call DisableShellcheckIssue()<CR>

" Return the Shellcheck error code (SCxxxx) if the current line has a
" Shellcheck issue, otherwise return 0. Note: to test if there is an issue
" need to explicitly compare the return value to 0, as Vim will coerce strings
" to integers...
function! s:LineHasShellcheckIssue()
  let l:error_regex = line('.') . ' col'

  Errors
  lopen
  let l:has_issue = search(l:error_regex)
  normal! $b"zyiw
  let l:issue = execute('echon @z')
  lclose

  if (!l:has_issue)
    echom 'No ShellCheck issue on current line.'
    return 0
  else
    return l:issue
  endif
endfunction
