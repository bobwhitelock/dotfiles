
alias ipinfo='curl ipinfo.io | jq .'

weather() {
    curl "wttr.in/$1"
}
