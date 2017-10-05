
alias mux="tmuxinator"

# Add new Tmux window (or session if not already in session) in given dir
# (defaulting to current dir); appropriately named and with panes for shell and
# Vim open.
add-window() {
    if [ -n "$TMUX" ]; then
        _tmux-create new-window "$*"
    else
        new-session "$*"
    fi
}
alias aw="add-window"

# Same as above, except only try to start a new session.
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

dot() {
    add-window "$DOTFILES"
}
