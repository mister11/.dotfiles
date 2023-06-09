#!/usr/bin/env bash

if [[ -z "$1" ]]; then
    echo "Please provide argument: home or work"
    exit 1
fi

modules="$HOME/.config/i3/config_modules"
i3_config_file="$HOME/.config/i3/config"

# generate shared parts of the config
rm -f "$i3_config_file"

echo "
    ########################################################
    ########## Generated by generate_config.sh #############
    ############# DO NOT EDIT MANUALLY #####################
    ## For changes, update files in config_modules folder ##
    ########################################################
" >> "$i3_config_file"

for f in "$modules"/*
do
    if [[ -f $f ]]; then
        cat "$f" >> "$i3_config_file"
    fi
done

# based on the provided parameter, generate specific config
if [[ "$1" = "home" ]]; then
    for f in "$modules/home"/*
    do
        if [[ -f $f ]]; then
            cat "$f" >> "$i3_config_file"
        fi
    done
elif [[ "$1" = "work" ]]; then
    for f in "$modules/work"/*
    do
        if [[ -f $f ]]; then
            cat "$f" >> "$i3_config_file"
        fi
    done
else
    echo "Unsupported parameter. Use: work or home"
fi
