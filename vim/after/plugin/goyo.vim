augroup goyo_autocmds
  autocmd User GoyoEnter nested call <SID>goyo_enter()
  autocmd User GoyoLeave nested call <SID>goyo_leave()
augroup END

function! s:goyo_enter()
  " Re-source vimrc when enter (and below, leave) Goyo, as it seems to mess up
  " some settings and colors, and this fixes this and ensures exactly the
  " settings I want are used.
  source $MYVIMRC

  set nonumber

  " TODO BW 2025-10-29: This will not currently be reset when leave again -
  " could track the previous state and then reset to this.
  Copilot disable

  " HiCursorWords in Goyo highlights the word the same colour as the
  " background for some reason; this setting effectively disables it in this
  " mode.
  " let g:HiCursorWords_hiGroupRegexp = 'SomethingWhichWillNeverOccur'
endfunction

function! s:goyo_leave()
  source $MYVIMRC

  " let g:HiCursorWords_hiGroupRegexp = ''
endfunction

" Note: you need to change the width of the Vim Tmux pane before entering
" Goyo, otherwise this will still be 50% of the original pane size.
let g:goyo_width = '50%'

nnoremap <leader>go :Goyo<CR>
