
which_edit() {
    # shellcheck disable=SC2230
    $EDITOR "$(which "$1")"
}

vim() {
    local vim_cmd
    # On Fedora, `vimx` from `vim-X11` is the fully featured Vim with
    # `+clipboard` support; alias `vim` to this if it's installed.
    (( $+commands[vimx] )) && vim_cmd=vimx || vim_cmd=vim

    if [ -f 'Session.vim' ] && [ "$*" = "" ]; then
        command "$vim_cmd" -S
    else
        command "$vim_cmd" "$@"
    fi
}

# Create, output name of, and edit a temporary file, with optional extension
# and part of name from args.
# XXX allow optional piping in to pre-seed file (see
# https://stackoverflow.com/questions/19619490/how-to-read-stdin-when-no-arguments-are-passed)
scratch() {
    local extension name file

    extension="$1"
    name="$2"

    mkdir -p /tmp/scratch/
    file="$(mktemp "/tmp/scratch/${name}XXXXX.${extension}")"
    echo "$file"
    "$EDITOR" "$file"
}
