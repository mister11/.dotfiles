#!/usr/bin/env bash


ROFI_CMD="rofi -p 'Display' \"\" -theme-str \"listview {lines: 2; scrollbar: false;} window {width: 15%;}\")"


CM_DIR="$HOME/.config/clipmenu" CM_LAUNCHER="'$ROFI_CMD'" clipmenu #&& xdotool key Ctrl+v
