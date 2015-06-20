#!/bin/bash

set -e

if [ "$1" = 'laptop' ]
then
    if [ "$2" = 'dual' ]
    then
        xrandr --output eDP1 --mode 1360x768 --left-of HDMI1 --output HDMI1 --auto
    else
        xrandr --output eDP1 --auto --output HDMI1 --off
    fi
elif [ "$2" = 'off' ]
then
    matched_outputs=$(xrandr | grep "$1")
    for line in "$matched_outputs"
    do
        output=$(echo "$line" | cut -d" " -f1)
        connected=$([ "$(echo "$line" | cut -d" " -f2)" = 'connected' ])
        echo "$output"
        echo "$connected"
        xrandr --output "$output" --off
    done
fi