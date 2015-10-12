" Load pathogen and plugins.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

:set background=dark
:colorscheme default

:set hlsearch " Highlight search results.

syntax enable
filetype plugin indent on

set undofile   " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Highlighting for Portal Sass and XHtml Haml templates (see lib/alces/action_view/templates.rb).
au BufReadPost *.pscss set syntax=scss
au BufReadPost *.xhaml set syntax=haml

let g:jsx_ext_required = 0 " Let vim-jsx handle JSX in `.js` files.

" shift-tab indents left in insert mode.
imap <S-Tab> <C-o><<

" tab/shift-tab to indent/unindent in visual mode.
vmap <Tab> >gv
vmap <S-Tab> <gv

" `,e`, `,t`, `,s` opens file/in new tab/in new split screen window relative
" to current file.
map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "/" <CR>
map ,s :split <C-R>=expand("%:p:h") . "/" <CR>
