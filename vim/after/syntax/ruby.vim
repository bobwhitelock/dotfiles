
" Highlight `HTML` heredoc as HTML.
call SyntaxRange#Include('^.*<<[-~]HTML.*$', 'HTML', 'html', 'NonText')
" XXX Causes infinite recursion with `SyntaxRange#Include` call in `./sh.vim`
" call SyntaxRange#Include('^.*<<[-~]SH.*$', 'SH', 'sh', 'NonText')
