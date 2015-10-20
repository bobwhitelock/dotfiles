
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
Plug 'kien/ctrlp.vim'

" Language-specific.
Plug 'kchmck/vim-coffee-script'
Plug 'tpope/vim-haml'
Plug 'andreimaxim/vim-io'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'evanmiller/nginx-vim-syntax'
Plug 'yaymukund/vim-rabl'
Plug 'tpope/vim-rails'
Plug 'kana/vim-textobj-user' | Plug 'nelstrom/vim-textobj-rubyblock' " Add Ruby text object (r).

" Passive features.
Plug 'tpope/vim-endwise' " Automatically end certain structures.
Plug 'tpope/vim-sleuth' " Automatic indent settings.
Plug 'tpope/vim-repeat' " Make '.' work with mappings.
Plug 'ntpeters/vim-better-whitespace' " Highlight trailing whitespace.
Plug 'henrik/vim-indexed-search' " Show number of search results.
Plug 'bling/vim-airline' " Status line.
Plug 'Yggdroot/indentLine' " Indentation lines.
Plug 'valloric/MatchTagAlways' " Highlight enclosing HTML/XML tags.

" Colorschemes.
Plug 'tomasr/molokai'
call plug#end()

colorscheme molokai

set hlsearch " Highlight search results.

" Highlight settings.
highlight Search ctermfg=black

set relativenumber " Show line numbers relative to current line.
set number " Show current line number (would be all lines without above).
set numberwidth=8 " Spacing always given to these numbers.

set undofile " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Add new splits on right/below existing.
set splitbelow
set splitright

set nowrap " Don't wrap lines.

" Start scrolling when certain distance from edges of window.
set scrolloff=8
set sidescrolloff=15
set sidescroll=1


" Highlighting for Portal Sass and XHtml Haml templates (see lib/alces/action_view/templates.rb).
au BufReadPost *.pscss set syntax=scss
au BufReadPost *.xhaml set syntax=haml

let g:jsx_ext_required = 0 " Let vim-jsx handle JSX in `.js` files.

let g:indentLine_char = '│' " indentLine character.

let g:ctrlp_custom_ignore = 'node_modules'

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xhtml' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx' : 1,
    \}

" shift-tab indents left in insert mode.
imap <S-Tab> <C-o><<

" tab/shift-tab to indent/unindent in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv

" `//` in visual mode to search for current selection.
vnoremap // y/<C-R>"<CR>

" `,e`, `,t`, `,s` opens file/in new tab/in new split screen window relative
" to current file.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>

" ,h/,v for horizontal/vertical splits.
noremap ,h :wincmd s<CR>
noremap ,v :wincmd v<CR>

" Arrow keys navigate split screens.
noremap <silent> <Up> :wincmd k<CR>
noremap <silent> <Down> :wincmd j<CR>
noremap <silent> <Left> :wincmd h<CR>
noremap <silent> <Right> :wincmd l<CR>

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
