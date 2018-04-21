
# Misc aliases.
alias treeall="command tree -C -a -I .git"
alias tree="treeall --filelimit 50"
alias pyserver="python2 -m SimpleHTTPServer"
alias grip="grip --browser"
alias rerun="rerun --pattern '**/*' --no-notify"
alias diff='vimdiff'
alias m='make'
alias sls='AWS_CLIENT_TIMEOUT=600000 serverless --aws-profile personal'
alias ipinfo='curl ipinfo.io | jq .'

# rsync="rsync -r --copy-links --delete --perms --human-readable --progress --exclude .git"
rsync="rsync -r --copy-links --delete --perms --human-readable --progress"
# shellcheck disable=SC2139
alias rsync="$rsync"
# shellcheck disable=SC2139
alias sync-dir="rerun --exit --pattern '**/*' -- $rsync ."
unset rsync

# List files installed on system by given package.
alias apt-files='dpkg-query --listfiles'

alias sz='source ~/.zshrc'
source-libs() {
    for file in "$ZSH_LIB/"*; do
        source "$file"
    done
}
alias sa="source-libs"

alias simple-prompt="SIMPLE_PROMPT=true sz"
alias simple-prompt-off="unset SIMPLE_PROMPT && sz"

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

# Let Vim interpret keys which would be interpreted by the terminal otherwise
# (see http://vim.wikia.com/wiki/Map_Ctrl-S_to_save_current_or_new_files).
alias vim="stty stop '' -ixoff ; vim"
alias v='vim'
ttyctl -f

# Ease transition between shell and vim.
alias :q="exit"
alias :qa="tmux kill-window"
alias :qa!="tmux kill-session"

# Copy/paste to/from system clipboard (xclip default is primary clipboard, i.e.
# middle-click clipboard).
alias cbcopy='xclip -selection clipboard'
alias cbpaste='xclip -selection clipboard -out'

du() {
    command du -h "$@" | sort -h
}
alias df='df --human-readable'

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

# Swap 2 filenames around, if they exist (from
# http://tldp.org/LDP/abs/html/sample-bashrc.html).
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
    cat <<-RUBY | ruby | jq .
        require 'yaml'
        require 'json'
        puts YAML.load_file('$1').to_json
RUBY
}

alias sshaddbob='ssh-add ~/.ssh/id_rsa.bob'
alias sshaddaws='ssh-add ~/.ssh/aws_ireland.pem'

ssh_remove_last_key() {
    ssh-keygen \
        -f ~/.ssh/known_hosts \
        -R "$(history -n | tail -n 1 | cut -d@ -f2)"
}

absolute-path() {
    readlink --canonicalize --no-newline "$@"
}
alias path='absolute-path'

weather() {
    curl "wttr.in/$1"
}

# Create, output name of, and edit a temporary file, with optional extension
# and part of name from args.
scratch() {
    local extension name file

    extension="$1"
    name="$2"

    mkdir -p /tmp/scratch/
    file="$(mktemp "/tmp/scratch/${name}XXXXX.${extension}")"
    echo "$file"
    "$EDITOR" "$file"
}

# Echo to stderr.
echoerr() {
    echo "$@" >&2
}
