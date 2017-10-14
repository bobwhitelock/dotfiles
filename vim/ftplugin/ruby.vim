
nnoremap <buffer> gl op<space><esc>a
nnoremap <buffer> gL Op<space><esc>a

" Add line to log current word.
nnoremap <buffer> <leader>gl mz"zyiwop '<C-r>z:', <C-r>z<esc>`z
nnoremap <buffer> <leader>gL mz"zyiwOp '<C-r>z:', <C-r>z<esc>`z

" Run only failing RSpec tests from last run, using vim-test.
nnoremap <buffer> <leader>tb :RSpec --only-failures<CR>

" Rubocop bindings - `<leader>ru` binding to lint current buffer defined by
" `vim-rubocop` plugin.

" Fix current buffer, without popping up quickfix window with what changed.
nnoremap <buffer> <leader>rf :RuboCop --auto-correct<CR>:wincmd p<CR>:cclose<CR>

" Lint/fix all files respectively, in Tmux pane
nnoremap <buffer> <leader>rU :Tmux rubocop<CR>
nnoremap <buffer> <leader>rF :Tmux rubocop --auto-correct<CR>

nnoremap <buffer> <leader>b :Tmux bundle<CR>
