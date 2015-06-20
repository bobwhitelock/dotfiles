:set expandtab
:set tabstop=2
:set background=dark
:colorscheme default

"call pathogen#infect() " TODO add back in this highlighting
syntax enable
filetype plugin indent on

" Highlighting for Portal Sass and XHtml Haml templates (see lib/alces/action_view/templates.rb).
au BufReadPost *.pscss set syntax=scss
au BufReadPost *.xhaml set syntax=haml
