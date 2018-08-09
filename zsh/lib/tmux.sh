
alias mux="tmuxinator"
alias aw="add_window"
alias rw="replace_window"
alias dots="aw \$DOTFILES"
alias dotsr="rw \$DOTFILES"
alias notes="aw \$NOTES"
alias notesr="rw \$NOTES"

# Utility function to be used by scripts.
# XXX Do not blindly continue if given dir which doesn't exist
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

_find-window-id() {
    local filter
    filter="$1"

    tmux list-windows | eval "$filter" | cut -d: -f1
}
