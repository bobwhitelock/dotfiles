" Load pathogen and plugins.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

:set background=dark
:colorscheme default

syntax enable
filetype plugin indent on

set undofile   " Maintain undo history between sessions.
set undodir=~/.vim/undodir " Dir for undo history.

" Highlighting for Portal Sass and XHtml Haml templates (see lib/alces/action_view/templates.rb).
au BufReadPost *.pscss set syntax=scss
au BufReadPost *.xhaml set syntax=haml
