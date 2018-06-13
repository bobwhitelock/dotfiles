
" Same as standard C-s maps, but also format current paragraph.
" noremap <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z
" noremap! <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z

nmap <buffer> <leader>3 ysip3

" Convert a regular markdown bullet to a checkbox.
Repeatable nnoremap <buffer> <leader>ctc mzF-a [ ]<esc>`z

" Check a checkbox in a checklist.
Repeatable nnoremap <buffer> <leader>x mz0f[lrx`z

" Uncheck all checked checkboxes (`[x]`) in a checklist.
command! -buffer -nargs=0 ClearChecklist %s/\[x\]/\[ \]/g

" Iterate through all checked/unchecked checboxes respectively.
command! -buffer -nargs=0 Checked /\[x]
command! -buffer -nargs=0 Unchecked /\[ ]

" Easily allow inserting checkbox in insert mode (without `auto-pairs` messing
" this up).
inoremap <buffer> -<space>[ <C-v>- <C-v>[ ]<space>
