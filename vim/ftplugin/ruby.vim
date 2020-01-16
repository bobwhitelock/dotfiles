
" Count '@' and '?' as part of a word (don't include '!' to avoid considering
" the whole of `!condition` as one word).
setlocal iskeyword+=@-@,?

" Add common RSpec `shared_examples` dir to path.
set path+=spec/shared_examples

" Run only failing RSpec tests from last run, using vim-test.
nnoremap <buffer> <leader>tb :CrTdd<CR>:call TmuxInterruptAndRun('RSpec --only-failures')<CR>

" Run only specific directories of tests for a Rails app (possibly these
" should be more complex like map above, or possibly that should be less
" complex).
nnoremap <buffer> <leader>tm :CrTdd<CR>:RSpec spec/models/<CR>
nnoremap <buffer> <leader>te :CrTdd<CR>:RSpec spec/features/<CR>

" Rubocop bindings - `<leader>ru` binding to lint current buffer defined by
" `vim-rubocop` plugin.

" Fix current buffer, without popping up quickfix window with what changed.
nnoremap <buffer> <leader>rf :RuboCop --auto-correct<CR>:wincmd p<CR>:cclose<CR>

" Lint/fix all files respectively, in Tmux pane
nnoremap <buffer> <leader>rU :Tmux rubocop<CR>
nnoremap <buffer> <leader>rF :Tmux rubocop --auto-correct<CR>

command! -buffer Bundle Tmux bundle

" Use command provided by vim-ruby-refactoring to extract a `let` for an
" assignment, delete the extraneous brackets included by this command, and
" then jump back to line below original position.
nmap <buffer> <leader>rel jmzk:RExtractLet<CR>wwds)i <Esc>`z
