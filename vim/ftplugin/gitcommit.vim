" Git commit message formatting: 50 char subject, 72 char body.
" This is a kludge Claude added to make this work again - it used to work
" before, but something somewhere had started overriding it, so need to
" override that again.
setlocal textwidth=72
augroup gitcommit_formatting
  autocmd! * <buffer>
  " First line (subject) should wrap at 50 chars.
  autocmd CursorMoved,CursorMovedI <buffer> if line('.') == 1 | setlocal textwidth=50 | else | setlocal textwidth=72 | endif
augroup END

nnoremap <buffer> <leader>f mzIfixup! <esc>`z
