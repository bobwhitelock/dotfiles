# shellcheck shell=bash

alias unixtime='date +%s'

# Show current time in given time zone, with completion of available time zones
# provided by `compleat/tz.usage`.
# XXX Add validation that `TZ` argument is passed, and is a valid time zone in
# `/usr/share/zoneinfo` (if it isn't get spurious results).
tz() {
    TZ="$1" date
}

# PST (UTC-8) or PDT (UTC-7)
alias pt='tz America/Los_Angeles'
alias california='pt'
alias sanfrancisco='california'
alias sf='sanfrancisco'
# MST (UTC-7) or MDT (UTC-6)
alias mt='tz America/Denver'
alias colorado='mt'
alias denver='colorado'
alias utah='mt'
# CST (UTC-6) or CDT (UTC-5)
alias ct='tz America/Chicago'
alias chicago='ct'
alias minnesota='ct'
alias texas='ct'
alias louisiana='ct'
# EST (UTC-5) or EDT (UTC-4)
alias et='tz America/New_York'
alias newyork='et'
alias ny='newyork'
# UTC/GMT or BST (UTC+1)
alias uk='tz Europe/London'
alias london='uk'
# UTC
alias utc='tz'
# CET (UTC+1) or CEST (UTC+2)
alias cet='tz Europe/Berlin'
alias germany='cet'
alias berlin='germany'
alias france='cet'
alias spain='cet'
# MSK (UTC+3)
alias moscow='tz Europe/Moscow'
# CST (UTC+8)
alias china='tz Asia/Shanghai'
# JST/KST (UTC+9)
alias korea='tz Asia/Seoul'
alias japan='tz Asia/Tokyo'

america() {
    echo "California                  PT    $(pt)"
    echo "Colorado/Utah               MT    $(mt)"
    echo "Minnesota/Illinois/Texas    CT    $(ct)"
    echo "New York                    ET    $(et)"
}
