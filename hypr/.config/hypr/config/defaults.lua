return {
    filemanager = "thunar",
    applauncher = "rofi -show drun -display-drun",
    terminal    = "kitty",
    capturing   = 'grim -g "$(slurp)" - | swappy -f -',
    mainMod     = "SUPER",
}
