
alias pyserver="python -m SimpleHTTPServer 8000"

alias pvm='ssh portalvm'

function ds() {
  # for 'detached screen'; launches screen for command with same name as command
  screen -d -m -S "$@" "$@"
}

# some ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function cl() {
    cd "$@" && l
}

alias tf='tail -f'

# Dotfiles aliases.
alias dot='~/.dotfiles/install'
alias dotconf='vim ~/.dotfiles/install.conf.yaml'

# Git aliases (copied from holman dot files, TODO look at.
alias g='git'
alias gp='git push'
alias gpl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gd='git diff'
alias gdc='git diff --cached'
alias gg='git grep'
alias gbl='git blame'
alias gst='git stash'
alias gc='git commit'
alias gca='git commit -a'
alias ga='git add'
alias gco='git checkout'
alias gcb='git copy-branch-name' # TODO does not exist
alias gb='git branch'
alias gs='git status -sb'

function launch() {
  ("$@" &> /dev/null &)
}

# from http://tldp.org/LDP/abs/html/sample-bashrc.html
function swap()
{ # Swap 2 filenames around, if they exist (from Uzi's bashrc).
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# from http://tldp.org/LDP/abs/html/sample-bashrc.html
function extract()      # Handy Extract Program
{
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xvjf $1     ;;
            *.tar.gz)    tar xvzf $1     ;;
            *.bz2)       bunzip2 $1      ;;
            *.rar)       unrar x $1      ;;
            *.gz)        gunzip $1       ;;
            *.tar)       tar xvf $1      ;;
            *.tbz2)      tar xvjf $1     ;;
            *.tgz)       tar xvzf $1     ;;
            *.zip)       unzip $1        ;;
            *.Z)         uncompress $1   ;;
            *.7z)        7z x $1         ;;
            *)           echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file!"
    fi
}

