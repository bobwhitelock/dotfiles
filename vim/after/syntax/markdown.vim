" Define rainbow colors - skip yellow as it's hard to read and too similar to
" orange.
" TODO BW 2025-10-21: Could experiment with better colours and find a yellow
" that works.
highlight markdownLevel1 ctermfg=Red guifg=Red
highlight markdownLevel2 ctermfg=214 guifg=#ff8700
highlight markdownLevel3 ctermfg=Green guifg=Green
highlight markdownLevel4 ctermfg=Cyan guifg=#00d7ff
highlight markdownLevel5 ctermfg=Magenta guifg=Purple

" Rainbow markdown headers.
syntax match markdownH1 "^#\s.*$"
syntax match markdownH2 "^##\s.*$"
syntax match markdownH3 "^###\s.*$"
syntax match markdownH4 "^####\s.*$"
syntax match markdownH5 "^#####\+\s.*$"

highlight link markdownH1 markdownLevel1
highlight link markdownH2 markdownLevel2
highlight link markdownH3 markdownLevel3
highlight link markdownH4 markdownLevel4
highlight link markdownH5 markdownLevel5

" Rainbow bullets by indentation.
syntax match markdownBullet1 "^[-*] "
syntax match markdownBullet2 "^  [-*] "
syntax match markdownBullet3 "^    [-*] "
syntax match markdownBullet4 "^      [-*] "
syntax match markdownBullet5 "^        \+[-*] "

highlight link markdownBullet1 markdownLevel1
highlight link markdownBullet2 markdownLevel2
highlight link markdownBullet3 markdownLevel3
highlight link markdownBullet4 markdownLevel4
highlight link markdownBullet5 markdownLevel5
