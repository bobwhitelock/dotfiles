
nnoremap <silent> <C-p> :GitFiles --cached --others --exclude-standard<CR>
nnoremap <silent> <C-f> :Tags<CR>

nnoremap <leader>/ :BLines<CR>
nnoremap <leader>fC :BCommits<CR>
nnoremap <leader>fF :Files<CR>
nnoremap <leader>fH :History<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fc :Commits<CR>
nnoremap <leader>ff :Filetypes<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fm :Maps<CR>
nnoremap <leader>fs :Snippets<CR>

" Fuzz files in Git repo of same language as current file (or at least with
" same extension, which is 90% of the way there).
nnoremap <leader>fl :execute "GitFiles --cached --others --exclude-standard '*." . expand("%:e") . "'"<CR>
