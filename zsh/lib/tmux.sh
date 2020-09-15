
alias mux='tmuxinator'

# Add new/replace current Tmux window, with pane for both shell and Vim.
alias aw='add_window --vim-pane'
alias rw='replace_window --vim-pane'

# Add new/replace current Tmux window, with just shell pane.
alias ap='add_window'
alias rp='replace_window'

alias dots="aw \$DOTFILES"
alias dotsr="rw \$DOTFILES"
alias notes="aw \$NOTES"
alias notesr="rw \$NOTES"

alias tmux_session_name="tmux display-message -p '#S'"

tmux_kill_unattached_sessions() {
    local session
    for session in $(tmux list-sessions | grep -v '(attached)' | cut -d: -f 1); do
        echo "Killing '$session'" >&2
        tmux kill-session -t "$session"
    done
}

# Utility function to create a new Tmux pane in the given directory, named
# after that directory, with optional Vim pane on right (when `--vim-pane`
# option passed).
_tmux_create() {
    local tmux_command vim_pane additional_commands args window_path window_name

    tmux_command="$1"
    shift

    if [ $# -ne 0 ] && [ "$1" == '--vim-pane' ]; then
        vim_pane='true'
        shift
    else
        vim_pane='false'
    fi

    args="$*"

    if [ -n "$args"  ]; then
        if [ ! -d "$args" ]; then
            echo "ERROR: Not a directory: \`$args\`" >&2
            return 1
        fi
    fi

    window_path=$(realpath "${args:-$(pwd)}")
    window_name=$(basename "$window_path")

    if [ "$vim_pane" == 'true' ]; then
        additional_commands="\\; split-window -hd -c $window_path \
            \\; send-keys -t 2 vim \
            \\; send-keys -t 2 Enter"
    else
        additional_commands=''
    fi

    eval "tmux $tmux_command -c $window_path -n $window_name $additional_commands"
}

_tmux_find_window_id() {
    local filter
    filter="$1"

    tmux list-windows | eval "$filter" | cut -d: -f1
}
