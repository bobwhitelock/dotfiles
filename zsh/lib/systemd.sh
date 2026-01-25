# shellcheck shell=bash

alias sys='sudo systemctl'
alias sS='sys status'

ss() {
    sys start "$@" && sleep 1 && sS "$@"
}

sr() {
    sys restart "$@" && sleep 1 && sS "$@"
}
