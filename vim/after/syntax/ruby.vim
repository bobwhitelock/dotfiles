
" Highlight heredoc with particular delimeter's as the language within them.
call SyntaxRange#Include('^.*<<[-~]HTML.*$', 'HTML', 'html', 'NonText')
" XXX Commented for now to avoid infinite recursion in syntax file loading ಠ_ಠ
" call SyntaxRange#Include('^.*<<[-~]RUBY.*$', 'RUBY', 'ruby', 'NonText')
" call SyntaxRange#Include('^.*<<[-~]SH.*$', 'SH', 'sh', 'NonText')
" call SyntaxRange#Include('^.*<<[-~]MARKDOWN.*$', 'MARKDOWN', 'markdown', 'NonText')
" call SyntaxRange#Include('^.*<<[-~]ERB.*$', 'ERB', 'eruby', 'NonText')
