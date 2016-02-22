
alias pyserver="python -m SimpleHTTPServer 8000"

alias pvm='sshpass -p alces ssh portalvm'
alias vacsvm='ssh bob@127.0.0.1 -p 9322'

# For 'detached screen'; launches screen for command with same name as command.
#complete -A command ds TODO: commented for moment as errors in zsh
function ds() {
    screen -d -m -S "$*" $@
}

# Some ls aliases.
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

function cl() {
    cd "$@" && l
}

# Git aliases.
alias g='git'
alias gp='git push'
alias gpl='git pull --prune'
alias glog="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%ar / %cr)%Creset' --abbrev-commit --date=relative"
alias glogall='glog --all'
alias gd='git diff --color'
alias gdc='git diff --cached'
alias gg='git grep'
alias gbl='git blame'
alias gst='git stash'
alias gc='git commit'
alias gca='git commit -a'
alias ga='git add'
alias gco='git checkout'
alias gr='git reset'
alias gb='git branch'
alias gs='git status -sb'
alias gsh='git show'
alias gbi='git bisect'
alias gbis='git bisect start'
alias gbir='git bisect reset'
alias gbib='git bisect bad'
alias gbig='git bisect good'

# Portal aliases.
alias pscreen='cd ~/alces-portal && screen -dr portal'
alias plog='cd ~/alces-portal && less log/development.log'
alias pconsole='cd ~/alces-portal && bin/rails console'
alias ppostgres='cd ~/alces-portal && psql portal'
alias pdir='cd ~/alces-portal'

# Alces aliases.
alias portal='cd ~/projects/alces/alces-portal-vm'
alias pegacluster='cd ~/projects/alces/pegacluster'

# Shortcuts for frequent xrandr commands.
alias xrandr_laptop_dual='xrandr --output eDP1 --mode 1360x768 --left-of HDMI1 --output HDMI1 --auto && conkywonky'
alias xrandr_laptop_single='xrandr --output eDP1 --auto --output HDMI1 --off && conkywonky'
function xrandr_off() {
    for output in "$(xrandr | cut -d ' '  -f 1 | grep -i "$@")"; do
        xrandr --output "$output" --off
    done
    conkywonky
}

# Let vim interpret commands which would be interpreted by the terminal
# otherwise; not quite sure of purpose of ttyctl here (from
# http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files).
alias vim="stty stop '' -ixoff ; vim"
ttyctl -f

# Listing and removing swp files within directory or children.
alias swps="ls -l **/.*.sw?"
alias swp_cleanup="rm -i **/.*sw?"

# Ease transition between shell and vim.
alias :q="exit"

# Because I can never remember how to do this.
function whats-blocking-port() {
    if [ -z "$1" ]; then
        sudo netstat -tulpn
    else
        sudo netstat -tulpn | grep ":$1[[:space:]]"
    fi
}

function launch() {
    ("$@" &> /dev/null &)
}

# Swap 2 filenames around, if they exist (from Uzi's bashrc).
# From http://tldp.org/LDP/abs/html/sample-bashrc.html.
function swap() {
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e $1 ] && echo "swap: $1 does not exist" && return 1
    [ ! -e $2 ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

# Handy Extract Program.
# From http://tldp.org/LDP/abs/html/sample-bashrc.html.
function extract() {
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

function yaml_validate() {
    ruby -e "require 'yaml'; YAML.load_file('$1')"
}
