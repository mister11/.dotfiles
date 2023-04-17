#!/usr/bin/env bash

options=("-> i3
-> zsh
-> aliases
-> kitty
-> i3_bar")

option=$(echo -e "$options" | \
    rofi -dmenu -i -p "Edit" "" \
    -theme-str 'listview {lines: 5; scrollbar: false;} window {width: 15%;}')

case $option in
    *i3)
        $TERMINAL nvim $HOME/.i3/config_modules
        ;;
    *zsh)
        $TERMINAL nvim $HOME/.zshrc
        ;;
    *aliases)
        $TERMINAL nvim $ZSH_CUSTOM/aliases.zsh
        ;;
    *kitty)
        $TERMINAL nvim $HOME/.config/kitty/kitty.conf
        ;;
    *i3_bar)
        $TERMINAL nvim $HOME/.config/i3status/config
        ;;
    *)
        exit 0
        ;;
esac
