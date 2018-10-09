
" Same as standard C-s maps, but also format current paragraph.
" noremap <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z
" noremap! <silent> <buffer> <C-s> <Esc>mzgqip:write<CR>`z

" So can write `@tag` in markdown files and search for this with `*`.
setlocal iskeyword+=@-@

nmap <buffer> <leader>3 ysip3

" Convert a regular markdown bullet to a checkbox (note: use `4l` here to
" negate the `a [ ]`, so cursor moved back to same original position).
Repeatable nnoremap <buffer> <leader>ctc mz0f-a [ ]<esc>`z4l

" Format and renumber a list (so long as all in one paragraph).
Repeatable nnoremap <buffer> <leader>F mzgqipvip:RenumberSelection<CR>`z

" Uncheck all checked checkboxes (`[x]`) in a checklist.
command! -buffer -nargs=0 ClearChecklist %s/\[x\]/\[ \]/g

" Iterate through all checked/unchecked checboxes respectively.
command! -buffer -nargs=0 Checked /\[x]
command! -buffer -nargs=0 Unchecked /\[ ]

" Easily allow inserting checkbox in insert mode (without `auto-pairs` messing
" this up).
inoremap <buffer> -<space>[ <C-v>- <C-v>[ ]<space>

