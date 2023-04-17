#!/usr/bin/env bash

question=$(echo " -> monitors| -> laptop" | rofi -sep "|"  \
            -dmenu -i -p 'Display' "" \
            -theme-str 'listview {lines: 2; scrollbar: false;} window {width: 15%;}')

case $question in
    *monitors)
        xrandr --output eDP1 --mode 1920x1080 --pos 3840x0 --rotate normal --output DP1 --primary --mode 1920x1200 --pos 1920x0 --rotate normal --output DP2 --off --output DP3 --mode 1920x1200 --pos 0x0 --rotate normal --output VIRTUAL1 --off
        ;;
    *laptop)
        xrandr --output eDP1 --primary --mode 1920x1080 --pos 0x0 --rotate normal --output DP1 --off --output DP2 --off --output DP3 --off --output VIRTUAL1 --off
        ;;
    *)
        exit 0  # do nothing on wrong response
        ;;
esac
