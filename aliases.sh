
# Some ls aliases.
alias ls='ls --color=always --classify'
alias l='ls'
alias ll='ls -l --all --human-readable'
alias la='ls --almost-all'

cl() {
    cd "$@" && l
}

# Misc aliases.
alias tree="tree -C -a --filelimit 50 -I .git"
alias pyserver="python -m SimpleHTTPServer 8000"
alias grip="grip --browser"
alias sz='source ~/.zshrc'
alias sa='source $DOTFILES/aliases.sh'
alias rg='rg --color always --heading'

# Git aliases.
alias g='git'
alias gp='git push'
alias gpf='gp --force-with-lease'
alias gpl='git pull --prune'
alias gd='git diff --color'
alias gdc='gd --cached'
alias gg='git grep'
alias gbl='git blame'
alias gst='git stash'
alias gc='git commit --verbose'
alias gca='gc --all'
alias ga='git add'
alias gco='git checkout'
alias gr='git reset'
alias gpop='gr HEAD~'
alias gb='git branch'
alias gs='git status -sb'
alias gsh='git show'
alias gcp='git cherry-pick'
alias gm='git merge'
alias gcf=' git clean --force'
alias gci=' git clean --interactive'

# cd to git repo root dir.
alias groot='cd "$(git rev-parse --show-toplevel)"'

alias glog="git log \
    --graph \
    --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%ar / %cr)%Creset' \
    --abbrev-commit \
    --date=relative"
alias glogall='glog --all'

alias gbi='git bisect'
alias gbis='gbi start'
alias gbir='gbi reset'
alias gbib='gbi bad'
alias gbig='gbi good'

alias gre='git rebase'
alias grec='gre --continue'
alias grea='gre --abort'
alias gres='gre --skip'
alias grei='gre --interactive'

# Alces aliases/functions.
alias pscreen='cd ~/alces-portal && screen -dr portal'
alias plog='cd ~/alces-portal && less log/development.log'
alias pconsole='cd ~/alces-portal && bin/rails console'
alias ppostgres='cd ~/alces-portal && psql portal'
alias pdir='cd ~/alces-portal'

alias pvm='sshpass -p alces ssh portalvm'
alias vacsvm='ssh bob@127.0.0.1 -p 9322'

# Kill/clean any running/leftover Clusterware sessions.
alces_kill_all_sessions() {
    for i in $(alces session list | cut -d ' ' -f 2 | tail -n +4 | head -n -1); do
        alces session kill "$i"
    done
    alces session clean
}

# Shortcuts for frequent xrandr commands.
alias xrandr_laptop_single="xrandr \
    --output DP2 --off \
    --output DP1 --off \
    --output HDMI3 --off \
    --output HDMI2 --off \
    --output HDMI1 --off \
    --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output VGA1 --off \
    && conkywonky"
alias xrandr_laptop_dual="xrandr \
    --output DP2 --off \
    --output DP1 --off \
    --output HDMI3 --off \
    --output HDMI2 --off \
    --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output VGA1 --off \
    && conkywonky"
alias xrandr_laptop_triple="xrandr \
    --output DP2 --off \
    --output DP1 --off \
    --output HDMI3 --off \
    --output HDMI2 --off \
    --output HDMI1 --mode 1920x1080 --pos 1920x0 --rotate normal \
    --output eDP1 --mode 1920x1080 --pos 0x0 --rotate normal \
    --output VGA1 --mode 1440x900 --pos 3840x180 --rotate normal \
    && conkywonky"

xrandr_off() {
    for arg in "$@"; do
        for output in $(xrandr | cut -d ' '  -f 1 | grep -i "$arg"); do
            xrandr --output "$output" --off
        done
    done
    conkywonky
}

# Let vim interpret commands which would be interpreted by the terminal
# otherwise; not quite sure of purpose of ttyctl here (from
# http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files).
alias vim="stty stop '' -ixoff ; vim"
ttyctl -f

# Ease transition between shell and vim.
alias :q="exit"
alias :qa="tmux kill-window"

# Copy/paste to/from system clipboard (xclip default is primary clipboard, i.e.
# middle-click clipboard).
alias cbcopy='xclip -selection clipboard'
alias cbpaste='xclip -selection clipboard -out'

# Explain the current rustc error.
rustc-explain() {
    rustc --explain $( \
        cargo build 2>&1 | \
        awk -F 'rustc --explain' '{ print $2 }' | \
        cut -d '`' -f 1
    )
}

# Vagrant aliases.
alias v="vagrant"
alias vs="vagrant status"
alias vssh="vagrant ssh || vagrant up && vagrant ssh"

vagrant-rebuild() {
    vagrant destroy --force && vagrant up --provision
}

# SSH into nth Vagrant VM.
vagrant-ssh() {
    local vm_number port
    vm_number="${1:-1}"
    if [[ $vm_number -eq 1 ]]; then
        port=2222
    else
        port=$((2200 + vm_number - 2))
    fi
    ssh -p "${port}" vagrant@localhost
}

# Forward host port to same port on a Vagrant VM using SSH port forwarding.
vagrant-forward-port() {
    local port vagrant_ssh_port
    port="$1"
    vagrant_ssh_port="${2:-2222}"
    ssh -L "${port}:localhost:${port}" -p "${vagrant_ssh_port}" vagrant@localhost
}

# Because I can never remember how to do this.
whats-blocking-port() {
    if [ -z "$1" ]; then
        sudo netstat -tulpn
    else
        sudo netstat -tulpn | grep ":$1[[:space:]]"
    fi
}

# Launch process independent of current process and ignoring all output.
launch() {
    ("$@" >/dev/null 2>&1 &)
}

# Add new Tmux window in given dir (defaulting to current dir); appropriately
# named and with panes for shell and Vim open.
add-window() {
    _tmux-create new-window "$*"
}
alias aw="add-window"

# Same as above, except start a new session for the window.
new-session() {
    _tmux-create new-session "$*"
}
alias ns="new-session"

# Utility function to be used by above.
_tmux-create() {
    local tmux_command args window_path window_name

    tmux_command="$1"
    shift
    args="$*"
    window_path=$(realpath "${args:-$(pwd)}")
    window_name=$(basename "$window_path")

    tmux "$tmux_command" \
        -c "$window_path" \
        -n "$window_name" \
        \; split-window -hd -c "$window_path" \
        \; send-keys -t 2 vim \
        \; send-keys -t 2 Enter
}

# Swap 2 filenames around, if they exist (from Uzi's bashrc).
# From http://tldp.org/LDP/abs/html/sample-bashrc.html.
swap() {
    local TMPFILE=tmp.$$

    [ $# -ne 2 ] && echo "swap: 2 arguments needed" && return 1
    [ ! -e "$1" ] && echo "swap: $1 does not exist" && return 1
    [ ! -e "$2" ] && echo "swap: $2 does not exist" && return 1

    mv "$1" $TMPFILE
    mv "$2" "$1"
    mv $TMPFILE "$2"
}

yaml_validate() {
    ruby -e "require 'yaml'; YAML.load_file('$1')"
}
