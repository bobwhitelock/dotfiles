
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

" Improved netrw.
Plug 'tpope/vim-vinegar'

" Various paired bracket mappings.
Plug 'tpope/vim-unimpaired'

" Date/time handling for C-a and C-x.
Plug 'tpope/vim-speeddating'

" Sublime-like multiple cursors (C-n).
Plug 'terryma/vim-multiple-cursors'

" Show git changes (]c/[c to jump between).
Plug 'airblade/vim-gitgutter'

" Fuzzy file/buffer/mru etc. finder (C-p, obviously).
Plug 'ctrlpvim/ctrlp.vim'

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

" Transition between single and multiline code (gS and gJ).
Plug 'AndrewRadev/splitjoin.vim'

" Switch text with pre-defined replacements e.g. || <-> && (gs).
Plug 'AndrewRadev/switch.vim'

" Look up documentation for word under cursor (gK).
Plug 'keith/investigate.vim'

" Motions through camel-case/underscore-case words (',b', ',w', ',e')
" TODO: broken at the moment fsr.
Plug 'bkad/CamelCaseMotion'

" Emacs-like handling of previously yanked text.
Plug 'vim-scripts/YankRing.vim'

" Better JavaScript support.
Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }

" For custom text objects, needed for all vim-textobj plugins.
Plug 'kana/vim-textobj-user'

" Variable (CamelCase or underscore) segment text object (iv / av).
Plug 'Julian/vim-textobj-variable-segment'

" Comment text object (ic / ac / aC)
Plug 'glts/vim-textobj-comment'

" Entire buffer text object (ie / ae).
Plug 'kana/vim-textobj-entire'

" For custom operators, needed for all vim-operator plugins.
Plug 'kana/vim-operator-user'

" Operator to replace with register content.
Plug 'kana/vim-operator-replace'
map _  <Plug>(operator-replace)

" Operator to search web.
Plug 'kana/vim-wwwsearch'
map gW <Plug>(operator-wwwsearch)
let g:wwwsearch_command_to_open_uri = "xdg-open {uri}"

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

" Adds commands to resize/create splits to/for current visual selection
" (VSResize, VSSplit etc).
Plug 'wellle/visual-split.vim'

" Language-specific.
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'andreimaxim/vim-io'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'nvie/vim-flake8'
Plug 'yaymukund/vim-rabl'
Plug 'tpope/vim-rails'
Plug 'nelstrom/vim-textobj-rubyblock' " Ruby block text object (ir / ar).

" Passive features.
Plug 'tpope/vim-endwise' " Automatically end certain structures.
Plug 'tpope/vim-sleuth' " Automatic indent settings.
Plug 'tpope/vim-repeat' " Make '.' work with mappings.
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace.
Plug 'henrik/vim-indexed-search' " Show number of search results.
Plug 'bling/vim-airline' " Status line.
Plug 'Yggdroot/indentLine' " Indentation lines.
Plug 'valloric/MatchTagAlways' " Highlight enclosing HTML/XML tags.
Plug 'jiangmiao/auto-pairs' " Inserting and deleting brackets.
Plug 'BobWhitelock/HiCursorWords' " Highlight occurrences of word under cursor.
Plug 'junegunn/vim-peekaboo' " Popup window showing all registers whenever attempt to access.

" Colorschemes.
Plug 'tomasr/molokai'
call plug#end()

colorscheme molokai

set hlsearch " Highlight search results.
set cursorline " Highlight current line.

" Highlight settings.
highlight Search ctermfg=black
highlight Visual ctermfg=233 ctermbg=67 guifg=#1b1d1e guibg=#465457

set relativenumber " Show line numbers relative to current line.
set number " Show current line number (would be all lines without above).
set numberwidth=8 " Spacing always given to these numbers.

set undofile " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Add new splits on right/below existing.
set splitbelow
set splitright

set lazyredraw " Redraw only when needed.

set linebreak " Wrap lines at better places.

set hidden " Allow hidden buffers with unsaved content.

set nostartofline " Don't move cursor to start of line after various commands.

set spell spelllang=en_gb " Enable spell checking (z= for corrections).

" Ignore these, specifically so not included in CtrlP file list.
set wildignore+=.git/*,*.swp,*.swo

" Start scrolling when certain distance from edges of window.
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" Highlighting for Portal Sass and XHtml Haml templates (see lib/alces/action_view/templates.rb).
au BufReadPost *.pscss set syntax=scss
au BufReadPost *.xhaml set syntax=haml

" Set other file types. (TODO: why difference between this and above?)
au BufNewFile,BufRead .babelrc,.eslintrc set filetype=json
au BufNewFile,BufRead gitconfig set filetype=gitconfig

let g:vim_json_syntax_conceal = 0 " Don't hide Json syntax.

let g:jsx_ext_required = 0 " Let vim-jsx handle JSX in `.js` files.

let g:indentLine_char = '│' " indentLine character.

let g:ctrlp_custom_ignore = 'node_modules'
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

" In git repos have CtrlP show files known to git (tracked and untracked but
" not ignored).
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

let g:closetag_filenames = "*.html,*.xhtml,*.xml,*.js"

let g:startify_bookmarks = ['~/.vimrc', '~/projects/alces/aviator', '~/projects/alces/exodus']
let g:startify_session_persistence = 1 " Save Session.vim on quit or new session load (if exists already).
let g:startify_change_to_vcs_root = 1 " Change to VCS root on file load.
let g:startify_list_order = [
    \ ['   MRU:'],
    \ 'files',
    \ ['   MRU (dir)'],
    \ 'dir',
    \ ['   Sessions:'],
    \ 'sessions',
    \ ['   Bookmarks:'],
    \ 'bookmarks',
    \ ]

let g:syntastic_javascript_checkers = ['eslint']

" TODO: Suggested Syntastic settings, read manual and adjust if needed.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Populate loc list with errors so can jump between with unimpaired's
" `[l` / `]l` (see https://github.com/scrooloose/syntastic/issues/341).
let g:syntastic_always_populate_loc_list = 1

let g:windowswap_map_keys = 0 " Prevent default bindings.
nnoremap <silent> gw :call WindowSwap#EasyWindowSwap()<CR>

let g:HiCursorWords_delay = 100

let g:yankring_replace_n_pkey = '<C-u>'
let g:yankring_replace_n_nkey = '<C-d>'

" TODO: let jsx just use js URL.
let g:investigate_url_for_javascript = "https://www.omniref.com/?language=javascript&q=^s"
let g:investigate_url_for_javascriptjsx = "https://www.omniref.com/?language=javascript&q=^s"

" Set up tern maps, see http://usevim.com/2013/05/24/tern/ for details.
let g:tern_map_prefix = ','
let g:tern_map_keys=1

" Map Space to Leader; don't use `mapleader` so something shows in `showcmd`
" corner.
map <Space> <Leader>

" Explicitly map double-space to double-leader for vim-easymotion.
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

" Move by visual line.
nnoremap j gj
nnoremap k gk

" shift-tab indents left in insert mode.
" TODO: some plugin seems to have broken this.
inoremap <S-Tab> <C-o><<

" tab/shift-tab to indent/unindent in visual mode.
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" Delete above/below current line.
noremap [<Backspace> mzkdd`z
noremap ]<Backspace> mzjdd`z

" * in visual mode to search for current selection.
vnoremap * y/<C-R>"<CR>

" Don't go to next immediately when searching current word.
nnoremap * *N

" Delete current buffer while preserving layout.
noremap <C-c> :Bdelete<CR>

" Open file relative to current file.
noremap <C-e> :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <silent> <C-y> :YRShow<CR>

" Easily create horizontal/vertical splits.
noremap <leader>h :wincmd s<CR>
noremap <leader>v :wincmd v<CR>

" Arrow keys navigate split screens.
" TODO: possibly remove in favour of C-j etc added with vim-tmux-navigator
noremap <silent> <Up> :wincmd k<CR>
noremap <silent> <Down> :wincmd j<CR>
noremap <silent> <Left> :wincmd h<CR>
noremap <silent> <Right> :wincmd l<CR>

" C-arrow for resizing windows.
noremap <C-Up> :wincmd +<CR>
noremap <C-Down> :wincmd -<CR>
noremap <C-Left> :wincmd <<CR>
noremap <C-Right> :wincmd ><CR>

" C-s to save in different modes.
nnoremap <silent> <C-s> :write<CR>
inoremap <silent> <C-s> <Esc>:write<CR>
vnoremap <silent> <C-s> <Esc>:write<CR>

" Map page up/down to C-u/C-d so cursor stays in same position.
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" Format Json and set filetype (adapted from
" coderwall.com/p/faceag/format-json-in-vim)
noremap <silent> =j :%!python -m json.tool<CR> :setfiletype json<CR>

nnoremap <leader>gu :GundoToggle<CR>

" Make directory relative to current file.
" TODO: make this a command instead e.g. MkdirRelative.
noremap <leader>mk :Mkdir <C-R>=expand("%:p:h") . "/" <CR>

" Git mappings.
" TODO: change to plug mappings?
" TODO: need to use nmap not nnoremap?
" TODO: grep for visual selection
nnoremap gb :Gblame<CR>
nnoremap gr :Ggrep! <cword> <CR><CR>
nnoremap <leader>gd :Gdiff<CR>
nmap <leader>gs <Plug>GitGutterStageHunk
nmap <leader>gr <Plug>GitGutterRevertHunk

" Automatically set/unset paste when pasting in insert mode
" (see http://superuser.com/a/904446 - will need changing if using vim within
" Tmux).
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"
inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()
function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
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
  let chars = empty(a:chars) ? '-' : a:chars
  let nr_columns = virtcol('$') - 1
  let uline = repeat(chars, (nr_columns / len(chars)) + 1)
  put =strpart(uline, 0, nr_columns)
endfunction
command! -nargs=? Underline call s:Underline(<q-args>)

" Open quickfix window after any grep.
autocmd QuickFixCmdPost *grep* cwindow

" Resize panes whenever containing window resized.
autocmd VimResized * wincmd =
