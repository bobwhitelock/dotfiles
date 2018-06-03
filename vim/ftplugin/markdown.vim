
" Same as standard C-s maps, but also format current paragraph.
" noremap <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z
" noremap! <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z

nmap <buffer> <leader>3 ysip3

" Check a checkbox in a checklist.
Repeatable nnoremap <buffer> <leader>x mz0f[lrx`z

" Uncheck all checked checkboxes (`[x]`) in a checklist.
command! -buffer -nargs=0 UncheckAll %s/\[x\]/\[ \]/g
