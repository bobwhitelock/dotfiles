
# Some ls aliases.
alias ls='ls --color=always --classify'
alias l='ls'
alias ll='ls -l --all --human-readable'
alias la='ls --almost-all'

cl() {
    cd "$@" && l
}

# Directory traversal aliases, stolen from
# https://github.com/robbyrussell/oh-my-zsh/blob/4fbfb149d3edcfe18b7b008c3a4a8e7523d4b811/lib/directories.zsh.
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'

alias -- -='cd -'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias d='dirs -v | head -10'
