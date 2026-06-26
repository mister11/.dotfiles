-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                   Defaults / Variables                      ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
--
-- The old `$var = value` substitution variables from defaults.conf.
-- Lua `require` modules don't share locals, so the shared program names
-- (and `mainMod`, previously `$mainMod` in hyprland.conf) live here as a
-- table that any other module can `require("config.defaults")`.

return {
    -- Programs
    filemanager = "thunar",
    applauncher = "rofi -show drun -display-drun",
    terminal    = "kitty",

    -- Idle / lock handler (was $idlehandler)
    idlehandler = "swayidle -w timeout 300 'swaylock -f -c 000000' before-sleep 'swaylock -f -c 000000'",

    -- Screen capture selection (was $capturing)
    capturing   = 'grim -g "$(slurp)" - | swappy -f -',

    -- Main modifier (was $mainMod = SUPER in hyprland.conf)
    mainMod     = "SUPER",
}
