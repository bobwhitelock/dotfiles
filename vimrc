" Load pathogen and plugins.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

:set background=dark
:colorscheme default

:set hlsearch " Highlight search results.

:set relativenumber " Show line numbers relative to current line.
:set number " Show current line number (would be all lines without above).
:set numberwidth=8 " Spacing always given to these numbers.

syntax enable
filetype plugin indent on

set undofile " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Watch and reload vimrc when changes, as well as common alternate names
" (see http://stackoverflow.com/a/2403926/2620402).
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END

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
