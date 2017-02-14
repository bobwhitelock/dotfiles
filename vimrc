
call plug#begin()
" Sensible defaults.
Plug 'tpope/vim-sensible'

" Handle surroundings (ys/cs/ds).
Plug 'tpope/vim-surround'

" Comment and uncomment (gc*)
Plug 'tpope/vim-commentary'

" Unix command helpers (e.g. SudoWrite).
Plug 'tpope/vim-eunuch'

" Git command helpers (:G*)
Plug 'tpope/vim-fugitive'

" Various paired bracket mappings.
Plug 'tpope/vim-unimpaired'

" Date/time handling for C-a and C-x.
Plug 'tpope/vim-speeddating'

" Readline key bindings for Vim (C-a, C-e etc.).
Plug 'tpope/vim-rsi'

" Show git changes in gutter.
Plug 'airblade/vim-gitgutter'

" Add :Bdelete command to close buffer without changing layout.
Plug 'moll/vim-bbye'

" Start screen and improved session management.
Plug 'mhinz/vim-startify'

" Syntax checking.
Plug 'scrooloose/syntastic'

" Single command for grabbing then swapping windows.
Plug 'wesQ3/vim-windowswap'

" Autocompletion.
Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }

" Reopen last-closed window (C-w u)
Plug 'AndrewRadev/undoquit.vim'

" Motions through camel-case/underscore-case words.
Plug 'bkad/CamelCaseMotion'

" Emacs-like handling of previously yanked text.
Plug 'vim-scripts/YankRing.vim'

" Add commands and functions to include different syntax settings within a
" file.
Plug 'vim-scripts/ingo-library'
Plug 'vim-scripts/SyntaxRange'

" For custom text objects, needed for all vim-textobj plugins.
Plug 'kana/vim-textobj-user'

" Variable (CamelCase or underscore) segment text object (iv / av).
Plug 'Julian/vim-textobj-variable-segment'

" Comment text object (ic / ac / aC)
Plug 'glts/vim-textobj-comment'

" Entire buffer text object (ie / ae).
Plug 'kana/vim-textobj-entire'

" HTML/XML attribute text object (ix / ax).
Plug 'whatyouhide/vim-textobj-xmlattr'

" Indent-level text object (ai / ii / aI / iI)
Plug 'michaeljsmith/vim-indent-object'

" For custom operators, needed for all vim-operator plugins.
Plug 'kana/vim-operator-user'

" Operator to replace with register content.
Plug 'kana/vim-operator-replace'
map _  <Plug>(operator-replace)

" Operator to search web.
" TODO: Modify this so can pass in the filetype and get more relevant results.
Plug 'kana/vim-wwwsearch'
map gW <Plug>(operator-wwwsearch)
let g:wwwsearch_command_to_open_uri = 'xdg-open {uri}'

" Operator to search using Ag/Ack/CtrlSF/Ggrep/etc.
Plug 'rgrinberg/vim-operator-gsearch'
map gr <Plug>(operator-ggrep)
" TODO: annoying: opens shell, jumps to first match
let g:gsearch_ggrep_command = 'Ggrep!'

" TODO: possibly consider below instead?
" Plug 'mhinz/vim-grepper' | Plug 'tpope/vim-dispatch'
" nmap gr <plug>(GrepperOperator) -tool git -open -noswitch<cr>
" xmap gr <plug>(GrepperOperator)

" View tree of all undos.
Plug 'sjl/gundo.vim/'

" Automatically close HTML/XML tags.
Plug 'alvan/vim-closetag'

" Improved navigation between vim and tmux panes (C-h/C-j/C-k/C-l).
Plug 'christoomey/vim-tmux-navigator'

" 2-character search motion (s/S).
Plug 'justinmk/vim-sneak'

" Better file browser than netrw.
Plug 'justinmk/vim-dirvish'

" Adds commands to resize/create splits to/for current visual selection
" (VSResize, VSSplit etc).
Plug 'wellle/visual-split.vim'

" Numerous extra text objects (see
" https://github.com/wellle/targets.vim/blob/master/cheatsheet.md).
Plug 'wellle/targets.vim'

" Make syntastic use local rather than global eslint - means uses installed
" eslint plugins as well.
Plug 'pmsorhaindo/syntastic-local-eslint.vim'

" Run eslint --fix for current JavaScript buffer.
Plug 'ruanyl/vim-fixmyjs'

" Fuzzy finder for many different sources.
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Search for current visual selection with */#.
Plug 'bronson/vim-visual-star-search'

" A Vim function to automatically commit to Git
Plug 'tlvince/vim-auto-commit'

" Commands to open browser + open specific pages on Github.
Plug 'tyru/open-browser.vim'
Plug 'tyru/open-browser-github.vim'

" Look things up in Zeal from Vim.
Plug 'KabbAmine/zeavim.vim'

" Language-specific.
Plug 'markcornick/vim-bats'
Plug 'kchmck/vim-coffee-script'
Plug 'ElmCast/elm-vim'
Plug 'rdolgushin/gitignore.vim'
Plug 'tpope/vim-haml'
Plug 'andreimaxim/vim-io'
Plug 'jelera/vim-javascript-syntax'
Plug 'gavocanov/vim-js-indent'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'tpope/vim-markdown'
Plug 'othree/nginx-contrib-vim'
Plug 'nvie/vim-flake8'
Plug 'tell-k/vim-autopep8'
Plug 'yaymukund/vim-rabl'
Plug 'tpope/vim-rails'
Plug 'Matt-Deacalion/vim-systemd-syntax'
Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (ir / ar).
Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

" Passive features.
Plug 'tpope/vim-endwise' " Automatically end certain structures.
Plug 'tpope/vim-sleuth' " Automatic indent settings.
Plug 'tpope/vim-repeat' " Make '.' work with mappings.
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace.
Plug 'henrik/vim-indexed-search' " Show number of search results.
Plug 'valloric/MatchTagAlways' " Highlight enclosing HTML/XML tags.
Plug 'jiangmiao/auto-pairs' " Inserting and deleting brackets.
Plug 'BobWhitelock/HiCursorWords' " Highlight occurrences of word under cursor.
Plug 'vimtaku/hl_matchit.vim' " Highlight matchit.vim matches.
Plug 'junegunn/vim-peekaboo' " Popup window showing all registers whenever attempt to access.
Plug 'ap/vim-css-color' " Highlight background of CSS colors.
Plug 'pbrisbin/vim-mkdir' " Automatically create parent directories on write when don't exist already.

" Indentation lines (Note: can seriously affect performance for files with
" long lines, see https://github.com/Yggdroot/indentLine/issues/48)
" Plug 'Yggdroot/indentLine'

 " Status line. Currently pinned to old commit as colours broke on upgrade.
Plug 'bling/vim-airline', { 'commit': 'ca6ab34' }

" Colorschemes.
Plug 'tomasr/molokai'
call plug#end()

colorscheme molokai

set cursorline " Highlight current line.

" Highlight settings.
highlight Search ctermfg=black
highlight Visual ctermfg=233 ctermbg=67 guifg=#1b1d1e guibg=#465457

set number " Show current line number.
set numberwidth=8 " Spacing always given to these numbers.

set undofile " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Don't use swap files. Cause more trouble than they're worth; saving often,
" undofiles, and committing often are better ways to avoid losing things.
set noswapfile

" Add new splits on right/below existing.
set splitbelow
set splitright

set lazyredraw " Redraw only when needed.

set linebreak " Wrap lines at better places.

set hidden " Allow hidden buffers with unsaved content.

set nostartofline " Don't move cursor to start of line after various commands.

set ignorecase " Ignore case in searches...
set smartcase " ...unless search includes a capital.

" Use correct language for spellcheck (cos to toggle; z= for corrections).
set spelllang=en_gb

" Ignore these in various cases.
set wildignore+=.git/*,*.swp,*.swo

" Start scrolling when certain distance from edges of window.
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

" Allow use of `gf` for relative imports in JS.
set suffixesadd+=.js

" Count '-' as part of a word; useful for CSS in particular.
set iskeyword+=-

" Allow modeline settings.
" TODO: Apparently insecure sometimes.
set modeline
set modelines=50

" Highlight shell scripts as bash by default unless specified otherwise.
let g:is_bash=1

augroup autocmds
  autocmd!

  " Miscellaneous file types.
  autocmd BufNewFile,BufRead .babelrc set filetype=javascript
  autocmd BufNewFile,BufRead .eslintrc,.reduxrc set filetype=json
  autocmd BufNewFile,BufRead gitconfig set filetype=gitconfig
  autocmd BufNewFile,BufRead Vagrantfile set filetype=ruby

  " oh-my-zsh themes are shell.
  autocmd BufNewFile,BufRead *.zsh-theme set filetype=sh

  " Clusterware serviceware metadata files are YAML with shell in, and the
  " shell is the more interesting part.
  autocmd BufNewFile,BufRead metadata.yml set filetype=sh

  " Clusterware modulefiles are Tcl.
  autocmd BufNewFile,BufRead *-module.template set filetype=tcl

  " Clusterware rc files are shell.
  autocmd BufNewFile,BufRead *.rc set filetype=sh

  " Open quickfix window after any grep.
  autocmd QuickFixCmdPost *grep* cwindow

  " Resize panes whenever containing window resized.
  autocmd VimResized * wincmd =

  " Automatically format Python according to PEP8.
  autocmd BufWritePost *.py call Autopep8()
augroup END

" Create CamelCaseMotion maps name-spaced behind leader.
call camelcasemotion#CreateMotionMappings('<leader>')

" Commands to enable/disable auto-committing on every save in git repos -
" useful when developing something where changes won't take effect until a
" commit is made, and can then squash when finished.
function! s:EnableAutoCommit()
  augroup git_auto_commit
    autocmd!
    autocmd BufWritePost * call AutoCommit()
  augroup END
endfunction
command! EnableAutoCommit call s:EnableAutoCommit()

function! s:DisableAutoCommit()
  augroup git_auto_commit
    autocmd!
  augroup END
endfunction
command! DisableAutoCommit call s:DisableAutoCommit()

" Low vim-plug timeout to get around issue where installing fails sometimes
" and have to wait 60 seconds for timeout.
let g:plug_timeout = 5

let g:vim_json_syntax_conceal = 0 " Don't hide Json syntax.

let g:jsx_ext_required = 0 " Let vim-jsx handle JSX in `.js` files.

let g:indentLine_char = '│' " indentLine character.

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

let g:closetag_filenames = '*.html,*.xhtml,*.xml,*.js,*.html.erb'

let g:markdown_fenced_languages = ['bash=sh']
let g:markdown_syntax_conceal = 0

" TODO: looks like there's a way in the docs to run commands on session save
" - could use to clean up old buffers?
let g:startify_session_persistence = 1 " Save Session.vim on quit or new session load (if exists already).
let g:startify_session_autoload = 1 " Autoload Session.vim on start, if it is present.
let g:startify_change_to_vcs_root = 1 " Change to VCS root on file load.
let g:startify_list_order = [
    \ ['   MRU:'],
    \ 'files',
    \ ['   MRU (dir)'],
    \ 'dir',
    \ ['   Sessions:'],
    \ 'sessions',
    \ ]

let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 0

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_vim_checkers = ['vint']
" Other Syntastic checkers:
" - ruby: rubocop
" - rust: rustc
" - shell: shellcheck

let g:fixmyjs_use_local = 1

" TODO: Suggested Syntastic settings, read manual and adjust if needed.

" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Populate loc list with errors so can jump between with unimpaired's
" `[l` / `]l` (see https://github.com/scrooloose/syntastic/issues/341).
let g:syntastic_always_populate_loc_list = 1

let g:windowswap_map_keys = 0 " Prevent default bindings.
nnoremap <silent> gw :call WindowSwap#EasyWindowSwap()<CR>

let g:HiCursorWords_delay = 100

let g:rustfmt_autosave = 1 " Run rustfmt on save of rust files.

let g:yankring_replace_n_pkey = '<C-u>'
let g:yankring_replace_n_nkey = '<C-d>'

let g:AutoPairsShortcutToggle = ''

let g:elm_setup_keybindings = 0
let g:elm_syntastic_show_warnings = 1
let g:elm_format_autosave = 1

let g:hl_matchit_enable_on_vim_startup = 1
let g:hl_matchit_hl_groupname = 'MatchParen'
let g:hl_matchit_speed_level = 2

" Default blacklist minus markdown, as completion can be useful there.
let g:ycm_filetype_blacklist = {
      \ 'tagbar' : 1,
      \ 'qf' : 1,
      \ 'notes' : 1,
      \ 'unite' : 1,
      \ 'text' : 1,
      \ 'vimwiki' : 1,
      \ 'pandoc' : 1,
      \ 'infolog' : 1,
      \ 'mail' : 1
      \}

let g:autopep8_disable_show_diff=1

" TODO:
" - way to make this shrink as less results?
" - adapt colours
" let g:fzf_layout = { 'down': '~20%' }

" Map Space to Leader; don't use `mapleader` so something shows in `showcmd`
" corner.
map <Space> <Leader>

" Explicitly map double-space to double-leader in case want to map this.
map <Space><Space> <Leader><Leader>

" Tmux window is maximized if any pane has the 'Z' flag.
function! TmuxMaximized()
  call system('tmux list-panes -F "#{window_flags}" | head -n 1 | grep Z')
  return !v:shell_error
endfunction

" Define custom vim-tmux-navigator mappings: if window is maximized only move
" within Vim panes, so navigating doesn't break out of Vim unexpectedly,
" otherwise navigate between Vim and Tmux as normal.
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <expr> <C-h> TmuxMaximized() ? ':wincmd h<CR>' : ':TmuxNavigateLeft<CR>'
nnoremap <silent> <expr> <C-j> TmuxMaximized() ? ':wincmd j<CR>' : ':TmuxNavigateDown<CR>'
nnoremap <silent> <expr> <C-k> TmuxMaximized() ? ':wincmd k<CR>' : ':TmuxNavigateUp<CR>'
nnoremap <silent> <expr> <C-l> TmuxMaximized() ? ':wincmd l<CR>' : ':TmuxNavigateRight<CR>'

" Normal previous pane mapping.
nnoremap <silent> <C-\> :TmuxNavigatePrevious<CR>

" Refresh screen and clear highlight with C-q C-l in Tmux, or just C-q
" otherwise (Tmux will then send us C-q). Mapping adapted from vim-sensible.
nnoremap <silent> <C-q> :nohlsearch<C-r>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-l>

nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader>sf :source %<CR>

" Move by visual line.
nnoremap j gj
nnoremap k gk

" Make Y behave like C and D.
nnoremap Y y$

" Easier macro executing (with added benefit of preventing accidentally
" entering 'Ex' mode).
nnoremap Q @q

" Search with more magic. - TODO: overwritten on initial load by plugin?
nnoremap / /\v
nnoremap ? ?\v

" Quick find and replace in file of current word with a new string, with and
" without confirmation respectively
nnoremap <leader>gc :%s/\<<C-r><C-w>\>//gcI<Left><Left><Left><Left>
nnoremap <leader>gg :%s/\<<C-r><C-w>\>//gI<Left><Left><Left>

" shift-tab indents left in insert mode.
" TODO: some plugin seems to have broken this.
inoremap <S-Tab> <C-o><<

" tab/shift-tab to indent/unindent in visual mode.
xnoremap <Tab> >gv
xnoremap <S-Tab> <gv

" Delete above/below current line.
noremap [<Backspace> mzkdd`z
noremap ]<Backspace> mzjdd`z

" Don't go to next immediately when searching current word.
" TODO: broken by indexed-search? - remove indexed search mappings then remap
" all with some changed
" nnoremap * <Plug>(indexed-search-*)N

" FZF maps.
nnoremap <silent> <C-p> :GitFiles<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <leader>gh :Helptags<CR>
nnoremap <leader>/ :BLines<CR>

" Close/open quickfix/location list windows.
nnoremap <leader>q :cclose<CR>
nnoremap <leader>Q :copen<CR>
nnoremap <leader>l :lclose<CR>
nnoremap <leader>L :lopen<CR>

" Move through quickfix list history.
nnoremap <silent> [Q :colder<CR>
nnoremap <silent> ]Q :cnewer<CR>

" Reload files in all windows.
nnoremap <leader>re :windo edit!<CR>

" Delete current buffer while preserving layout.
noremap <C-c> :Bdelete<CR>

" Open file relative to current file.
noremap <C-e> :e <C-R>=expand("%:p:h") . "/" <CR>

" Easily create horizontal/vertical splits.
noremap <leader>h :wincmd s<CR>
noremap <leader>v :wincmd v<CR>

" C-arrow for resizing windows.
" TODO: stopped working.
noremap <C-Up> :wincmd +<CR>
noremap <C-Down> :wincmd -<CR>
noremap <C-Left> :wincmd <<CR>
noremap <C-Right> :wincmd ><CR>

" C-s to save in all modes.
noremap <silent> <C-s> <Esc>:write<CR>
noremap! <silent> <C-s> <Esc>:write<CR>

" Map page up/down to C-u/C-d so cursor stays in same position.
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" Format Json and set filetype (adapted from
" coderwall.com/p/faceag/format-json-in-vim)
noremap <silent> =J :%!python -m json.tool<CR> :setfiletype json<CR>

nnoremap <leader>gu :GundoToggle<CR>

xnoremap gz :sort<CR>

nnoremap <leader>tn :tabnew<CR>
nnoremap <leader>tc :tabclose<CR>

" Make directory relative to current file.
" TODO: make this a command instead e.g. MkdirRelative.
noremap <leader>mk :Mkdir <C-R>=expand("%:p:h") . "/" <CR>

" Git mappings.
" TODO: change to plug mappings?
nnoremap gb :Gblame<CR>
nnoremap gd :Gdiff<CR>

" Grep for current filename, less extension if present.
nnoremap <leader>gf :Ggrep! <C-R>=expand('%:t:r')<CR><CR><CR>

nnoremap <leader>G :Ggrep!<space>

let g:gitgutter_map_keys = 0
nmap <leader>gs <Plug>GitGutterStageHunk
nmap <leader>gr <Plug>GitGutterUndoHunk
nmap <leader>gp <Plug>GitGutterPreviewHunk
nmap [h <Plug>GitGutterPrevHunk
nmap ]h <Plug>GitGutterNextHunk
omap ih <Plug>GitGutterTextObjectInnerPending
omap ah <Plug>GitGutterTextObjectOuterPending
xmap ih <Plug>GitGutterTextObjectInnerVisual
xmap ah <Plug>GitGutterTextObjectOuterVisual

" Resize to show entire buffer (or as much as possible).
nmap <silent> gV mzvae:VSResize<CR>`z

" Resize quickfix window to fit content.
function! ResizeQuickFix()
  let s:current_window = winnr()

  copen
  execute "normal! mzggvG:VSResize\<CR>`z"

  " Return to previous window; can't use <C-w>p as visual-split changes
  " previous window.
  execute 'normal! ' . s:current_window . "\<C-w>w"
endfunction
nnoremap gQ :call ResizeQuickFix()<CR>

" Resize to/split out visual selection.
xnoremap <silent> gV :VSResize<CR>
xnoremap <silent> gA :VSSplitAbove<CR>
xnoremap <silent> gB :VSSplitBelow<CR>

xnoremap <silent> SI :SyntaxInclude<space>

" Maps for using system clipboard with <leader> instead of "+.
" TODO: Make <leader>_ maps not pop up register window
xnoremap <leader>d "+d
xnoremap <leader>y "+y
xnoremap <leader>p "+p
xnoremap <leader>P "+P
xmap <leader>_ "+_
nnoremap <leader>d "+d
nnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P
nmap <leader>_ "+_

" Move last thing yanked to system clipboard.
nnoremap <leader>c :let @+=@"<cr>:echo "copied!"<cr>

" Copy path to current file to system clipboard.
nnoremap <leader>C :let @+ = expand("%")<CR>:echo "copied path!"<CR>

" Paste above/below, justify, and return to original position.
nnoremap <leader>A mzO<esc>p==`z
nnoremap <leader>B mzo<esc>p==`z

" Use X clipboard.
" TODO: Have this switch back the other way to Vim clipboard too.
" TODO: Does not work on initial load as unimpaired clobbers
nnoremap cox :set clipboard=unnamedplus<CR>

" Make J not shift cursor position.
nnoremap J mzJ`z

" Join current line with line above; also do not move cursor as with J above.
nnoremap K mzkJ`z

" Access original 'K' meaning.
nnoremap gK K

" Open current file/current visual selection of current file in Github.
nnoremap gh :OpenGithubFile<CR><CR>
xnoremap gh :'<,'>OpenGithubFile<CR><CR>

" Automatically set/unset paste when pasting in insert mode
" (see http://superuser.com/a/904446 - simpler method works for me under Tmux,
" and more complex one doesn't).
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ''
endfunction

" From http://stackoverflow.com/a/8459043/2620402.
function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

" From http://vim.wikia.com/wiki/Underline_using_dashes_automatically.
function! s:Underline(chars)
  let chars = empty(a:chars) ? '=' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)
