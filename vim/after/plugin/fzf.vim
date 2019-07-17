
nnoremap <silent> <C-p> :GitFiles --cached --others --exclude-standard<CR>
nnoremap <silent> <C-f> :Tags<CR>

nnoremap <leader>fb :BLines<CR>
nnoremap <leader>/ :BTags<CR>
nnoremap <leader>f/ :BTags<CR>

nnoremap <leader>fF :Files<CR>
nnoremap <leader>fB :Buffers<CR>
" 'Fuzz recent'.
nnoremap <leader>fr :History<CR>

nnoremap <leader>fc :Commits<CR>
nnoremap <leader>fC :BCommits<CR>

nnoremap <leader>ff :Filetypes<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fs :Snippets<CR>

" Fuzz files in Git repo of same language as current file (or at least with
" same extension, which is 90% of the way there).
nnoremap <leader>fl :execute "GitFiles --cached --others --exclude-standard '*." . expand("%:e") . "'"<CR>
