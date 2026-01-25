# shellcheck shell=bash

ipinfo() {
    curl "ipinfo.io/$1" | jq .
}

weather() {
    curl "wttr.in/$1"
}
