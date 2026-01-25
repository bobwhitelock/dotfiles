# shellcheck shell=bash

# Output commands from history in order from least to most used. Tweaked from
# https://dev.to/abhinav/which-is-the-most-used-command-in-your-shell-history-5ca1.
# Columns: usage rank | times used | percent usage | command.
most_used() {
    history 1 | \
        cat | \
        awk '{CMD[$2]++;count++;}END { for (a in CMD)print CMD[a] " " CMD[a]/count*100 "% " a; }' | \
        grep -v "./" | \
        column -c3 -s " " -t | \
        sort -n | \
        tac | \
        nl | \
        tac
}
