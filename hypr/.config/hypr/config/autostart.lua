-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Autostart Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
--
-- The old `exec-once =` directives run once on launch. In Lua they go inside
-- an `hl.on("hyprland.start", ...)` callback.
-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local defaults = require("config.defaults")

hl.on("hyprland.start", function()
    -- Wallpaper: pick a random one from ~/Pictures/wallpapers
    hl.exec_cmd("swaybg -o \\* -i $(find ~/Pictures/wallpapers/. -type f | shuf -n1) -m fill")

    hl.exec_cmd("waybar &")
    hl.exec_cmd("mako &")
    hl.exec_cmd("nm-applet --indicator &")

    -- wob progress bar fifo
    hl.exec_cmd([[bash -c "mkfifo /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob && tail -f /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob | wob & disown" &]])

    hl.exec_cmd("/usr/lib/polkit-kde-authentication-agent-1 &")

    -- Stores only text data
    hl.exec_cmd("wl-paste --watch cliphist store")

    -- Slow app launch fix
    hl.exec_cmd("systemctl --user import-environment &")
    hl.exec_cmd("hash dbus-update-activation-environment 2>/dev/null &")
    hl.exec_cmd("dbus-update-activation-environment --systemd &")

    -- Idle configuration (was $idlehandler)
    hl.exec_cmd(defaults.idlehandler)

    -- Custom apps
    hl.exec_cmd("megasync &")
end)
