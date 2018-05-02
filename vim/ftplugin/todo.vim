
let g:Todo_txt_prefix_creation_date=1

setlocal iskeyword+=@-@,-,+
setlocal nofoldenable

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
