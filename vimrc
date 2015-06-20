" Load pathogen and plugins.
runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

:set expandtab
:set tabstop=2
:set background=dark
:colorscheme default

syntax enable
filetype plugin indent on

" Highlighting for Portal Sass and XHtml Haml templates (see lib/alces/action_view/templates.rb).
au BufReadPost *.pscss set syntax=scss
au BufReadPost *.xhaml set syntax=haml
