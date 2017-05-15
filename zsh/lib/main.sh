
# Misc aliases.
alias treeall="command tree -C -a -I .git"
alias tree="treeall --filelimit 50"
alias pyserver="python -m SimpleHTTPServer"
alias grip="grip --browser"
alias rsync='rerun --exit --pattern "**/*" -- rsync --human-readable --progress'
alias diff='vimdiff'
alias m='make'
alias be='bundle exec'
alias rspec='be rspec'

# List files installed on system by given package.
alias apt-files='dpkg-query --listfiles'

alias sz='source ~/.zshrc'
source-libs() {
    for file in "$ZSH_LIB/"*; do
        source "$file"
    done
}
alias sa="source-libs"

which-edit() {
    $EDITOR "$(which "$1")"
}

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

du() {
    command du -h "$@" | sort -h
}

# Explain the current rustc error.
rustc-explain() {
    # Word splitting required here for this to work.
    # shellcheck disable=SC2046
    rustc --explain $( \
        cargo build 2>&1 | \
        awk -F 'rustc --explain' '{ print $2 }' | \
        cut -d '`' -f 1
    )
}

rgp() {
    rg --pretty "$@" | less
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

# Pretty-print a YAML file as JSON.
yaml_to_json() {
    cat <<RUBY | ruby | jq .
require 'yaml'
require 'json'
puts YAML.load_file('$1').to_json
RUBY
}

ssh_remove_last_key() {
    ssh-keygen \
        -f ~/.ssh/known_hosts \
        -R "$(history -n | tail -n 1 | cut -d@ -f2)"
}
