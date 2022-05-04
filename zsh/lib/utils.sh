
# Misc aliases.
alias cat='bat'
alias df='df --human-readable'
alias diff='diff --color=always'
alias m='make'
alias open='xdg-open'
alias pyserver="python -m http.server"
alias rerun="rerun --pattern '**/*' --no-notify"
alias sa="source_libs"
alias spark='sparklines'
alias split_words="sed 's/\s/\n/g'"
alias sz='source ~/.zshrc'
alias urldecode='ruby -r cgi -e "puts CGI.unescape(ARGV[0])"'
alias urlencode='ruby -r cgi -e "puts CGI.escape(ARGV[0])"'

# From https://unix.stackexchange.com/a/102021/229081.
alias trim="sed 's/^[[:blank:]]*//;s/[[:blank:]]*$//'"

# Make copy/paste-ing in commands from examples slightly more seamless.
alias '$'=''

# Switch to minimal prompt, most useful for copying terminal output to share
# elsewhere. Run `sz` to revert to normal prompt.
alias simple_prompt='PS1="$ "'

# Copy/paste to/from system clipboard (xclip default is primary clipboard, i.e.
# middle-click clipboard).
alias cbcopy='xclip -selection clipboard'
alias cbpaste='xclip -selection clipboard -out'

# Quickly switch between UK and US keyboard layouts.
alias ukk='setxkbmap gb'
alias usk='setxkbmap us'

du() {
    command du -h "$@" | sort -h
}

# "ripgrep pretty", i.e. with output always coloured and piped to `bat`.
rgp() {
    rg --pretty "$@" | bat
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

absolute_path() {
    readlink --canonicalize --no-newline "$@"
}
alias path='absolute_path'

# Echo to stderr.
echoerr() {
    echo "$@" >&2
}

# Compress and tar a directory.
# XXX Make this better:
# - check dir exists and use dir first
# - abort if no arg given
tar_dir() {
    tar -zcvf "$1".tar.gz "$1"
}

# Show output of `ps` for all processes matching `pgrep`.
pshow() {
    pgrep "$@" | xargs --no-run-if-empty ps -l
}
