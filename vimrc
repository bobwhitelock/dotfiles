
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

Plug 'sjl/gundo.vim/'
" Language-specific.
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'andreimaxim/vim-io'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'evanmiller/nginx-vim-syntax'
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

let g:yankring_replace_n_pkey = '<C-a>'
let g:yankring_replace_n_nkey = '<C-d>'

" TODO: let jsx just use js URL.
let g:investigate_url_for_javascript = "https://www.omniref.com/?language=javascript&q=^s"
let g:investigate_url_for_javascriptjsx = "https://www.omniref.com/?language=javascript&q=^s"

" Set up tern maps, see http://usevim.com/2013/05/24/tern/ for details.
let g:tern_map_prefix = ','
let g:tern_map_keys=1

let mapleader = ','

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

" Search and delete buffers.
noremap <C-b> :CtrlPBuffer<CR>
noremap <C-c> :Bdelete<CR>

" Open file relative to current file.
noremap <C-e> :e <C-R>=expand("%:p:h") . "/" <CR>

nnoremap <silent> <C-y> :YRShow<CR>

" ,h/,v for horizontal/vertical splits.
noremap ,h :wincmd s<CR>
noremap ,v :wincmd v<CR>

" Arrow keys navigate split screens.
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
nnoremap <silent> <C-s> :update<CR>
inoremap <silent> <C-s> <Esc>:update<CR>
vnoremap <silent> <C-s> <Esc>:update<CR>gv

" Map page up/down to C-u/C-d so cursor stays in same position.
nnoremap <PageUp> <C-u>
nnoremap <PageDown> <C-d>

" Format Json and set filetype (adapted from
" coderwall.com/p/faceag/format-json-in-vim)
noremap <silent> =j :%!python -m json.tool<CR> :setfiletype json<CR>

nnoremap ,gu :GundoToggle<CR>

" Make directory relative to current file.
" TODO: make this a command instead e.g. MkdirRelative.
noremap ,mk :Mkdir <C-R>=expand("%:p:h") . "/" <CR>

" Git mappings.
nnoremap gb :Gblame<CR>
nnoremap gr :Ggrep! <cword> <CR><CR>
nmap ,gs <Plug>GitGutterStageHunk
nmap ,gr <Plug>GitGutterRevertHunk
" TODO: grep for visual selection

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

" Open quickfix window after any grep.
autocmd QuickFixCmdPost *grep* cwindow
