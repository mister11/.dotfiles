#!/usr/bin/env bash

options=("-> lock
-> suspend
-> logout
-> reboot
-> shutdown")

option=$(echo -e "$options" | \
    rofi -dmenu -i -p "Power menu" "" \
    -theme-str 'listview {lines: 5; scrollbar: false;} window {width: 15%;}')

case $option in
    *lock)
        i3lock-fancy-rapid 10 pixel
        ;;
    *suspend)
        systemctl suspend
        ;;
    *logout)
        i3-msg exit
        ;;
    *reboot)
        systemctl reboot
        ;;
    *shutdown)
        systemctl poweroff
        ;;
    *)
        exit 0  # do nothing on wrong response
        ;;
esac
