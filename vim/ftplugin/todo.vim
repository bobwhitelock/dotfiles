
let g:Todo_txt_prefix_creation_date=1
let g:TodoTxtForceDoneName='done.todo'

setlocal iskeyword+=@-@,-,+
setlocal nofoldenable

" Override Vimrc setting so can open URLs containing `#` with `gx`.
setlocal isfname+=#

" Make `gf` on project tag (`+project`) open corresponding project file or
" directory.
setlocal isfname-=+
setlocal path+=projects/
setlocal suffixesadd+=.md

" Regardless of current file line endings use Unix line endings; needed as
" Dropbox and/or Simpletask always converts line endings to CRLF.
setlocal fileformat=unix

" Use completion function from https://github.com/dbeniamine/todo.txt-vim.
setlocal omnifunc=todo#Complete

" Do not open preview window on completion.
setlocal completeopt-=preview

" Show completions even if only one.
setlocal completeopt+=menuone

" Remove mapping many things, overwriting existing maps; copy in just needed
" maps from https://github.com/dbeniamine/todo.txt-vim below.
let g:Todo_txt_do_not_map=1

noremap <script> <silent> <buffer> <localleader>j :call todo#PrioritizeIncrease()<CR>
noremap <script> <silent> <buffer> <localleader>k :call todo#PrioritizeDecrease()<CR>

noremap <script> <silent> <buffer> <localleader>a :call todo#PrioritizeAdd('A')<CR>
noremap <script> <silent> <buffer> <localleader>b :call todo#PrioritizeAdd('B')<CR>
noremap <script> <silent> <buffer> <localleader>c :call todo#PrioritizeAdd('C')<CR>

nmap <silent> <buffer> <localleader>x <Plug>DoToggleMarkAsDone
nnoremap <script> <silent> <buffer> <localleader>D :call todo#RemoveCompleted()<CR>

nnoremap <script> <silent> <buffer> <localleader>s@ :sort /.\{-}\ze@/ <CR>
nnoremap <script> <silent> <buffer> <localleader>s+ :sort /.\{-}\ze+/ <CR>

" Todo file filtering maps, using commands from `vim-hideshow`.
nnoremap <buffer> <leader>sa :ShowAll<CR>
nnoremap <buffer> <leader>ss :Show<space>
nnoremap <buffer> <leader>st :ShowAll<CR>:Show @today<CR>
nnoremap <buffer> <leader>sww :ShowAll<CR>:Show @work<CR>
nnoremap <buffer> <leader>swt :ShowAll<CR>:Show @work.*@today<CR>
