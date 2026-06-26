-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
--
-- hl.bind(KEYS, DISPATCHER, OPTS?)
--   KEYS       — "MOD + MOD + KEY" string (mainMod .. " + RETURN")
--   DISPATCHER — an hl.dsp.* value or a plain function
--   OPTS       — { description = ..., locked = true, repeating = true, ... }
-- See https://wiki.hypr.land/Configuring/Basics/Binds/

local defaults = require("config.defaults")
local mainMod  = defaults.mainMod

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(defaults.terminal),     { description = "Opens your preferred terminal emulator ($terminal)" })
hl.bind(mainMod .. " + E",      hl.dsp.exec_cmd(defaults.filemanager),  { description = "Opens your preferred filemanager ($filemanager)" })
hl.bind(mainMod .. " + A",      hl.dsp.exec_cmd(defaults.capturing),    { description = "Screen capture selection" })
hl.bind(mainMod .. " + SHIFT + Q", hl.dsp.window.close(),               { description = "Closes (not kill) current window" })
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.exec_cmd('loginctl terminate-user ""'), { description = "Exits Hyprland by terminating the user sessions" })
hl.bind(mainMod .. " + F",      hl.dsp.window.float({ action = "toggle" }), { description = "Switches current window between floating and tiling mode" })
hl.bind(mainMod .. " + D",      hl.dsp.exec_cmd(defaults.applauncher),  { description = "Runs your application launcher" })
hl.bind(mainMod .. " + CTRL + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }), { description = "Toggles current window fullscreen mode" })
hl.bind(mainMod .. " + COMMA",  hl.dsp.layout("togglesplit"),           { description = "Toggles current window split mode" }) -- dwindle

-- Mako
hl.bind("CTRL + SPACE", hl.dsp.exec_cmd("makoctl dismiss"))
hl.bind("CTRL + GRAVE", hl.dsp.exec_cmd("makoctl restore"))

-- Clipboard
-- hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))
hl.bind(mainMod .. " + SHIFT + V", hl.dsp.exec_cmd("$HOME/.local/bin/paste_from_clipboard_hypr"))

-- ======= Grouping Windows =======
-- TODO: tabs
-- hl.bind(mainMod .. " + K",   hl.dsp.group.toggle(), { description = "Toggles current window group mode" })
-- hl.bind(mainMod .. " + Tab", hl.dsp.group.next(),   { description = "Switches to the next window in the group" })

-- ======= Toggle Gaps =======
hl.bind(mainMod .. " + SHIFT + G", hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"'), { description = "Set CachyOS default gaps" })
hl.bind(mainMod .. " + G",         hl.dsp.exec_cmd('hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"'), { description = "Remove gaps between window" })

-- ======= Volume Control =======
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd([==[pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]==]), { locked = true, repeating = true }) -- Raise Volume
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd([==[pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]==]), { locked = true, repeating = true }) -- Lower Volume
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd([==[amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]==]), { locked = true, repeating = true }) -- Mutes player audio

-- ======= Playback Control =======
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggles play/pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),       { description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"),   { description = "Previous track" })

-- ======= Screen Brightness =======
hl.bind("XF86MonBrightnessUp",   hl.dsp.exec_cmd("brightnessctl s +5%"), { locked = true, repeating = true }) -- Increases brightness 5%
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { locked = true, repeating = true }) -- Decreases brightness 5%
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("gnome-calculator"), { description = "Runs the calculator application" })
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd("swaylock-fancy -e -K -p 10 -f Hack-Regular"), { description = "Lock the screen" })
hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("killall -SIGUSR2 waybar"), { description = "Reload/restarts Waybar" })

-- ======= Window Actions =======

-- Move window with mainMod + LMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { description = "Move the window towards a direction" })

-- Move active window towards a direction
hl.bind(mainMod .. " + CTRL + SHIFT + left",  hl.dsp.window.move({ direction = "l" }), { description = "Move active window to the left" })
hl.bind(mainMod .. " + CTRL + SHIFT + right", hl.dsp.window.move({ direction = "r" }), { description = "Move active window to the right" })
hl.bind(mainMod .. " + CTRL + SHIFT + up",    hl.dsp.window.move({ direction = "u" }), { description = "Move active window upwards" })
hl.bind(mainMod .. " + CTRL + SHIFT + down",  hl.dsp.window.move({ direction = "d" }), { description = "Move active window downwards" })
hl.bind(mainMod .. " + CTRL + SHIFT + H", hl.dsp.window.move({ direction = "l" }), { description = "Move active window to the left" })
hl.bind(mainMod .. " + CTRL + SHIFT + L", hl.dsp.window.move({ direction = "r" }), { description = "Move active window to the right" })
hl.bind(mainMod .. " + CTRL + SHIFT + J", hl.dsp.window.move({ direction = "u" }), { description = "Move active window upwards" })
hl.bind(mainMod .. " + CTRL + SHIFT + K", hl.dsp.window.move({ direction = "d" }), { description = "Move active window downwards" })

-- Move focus with mainMod + arrow keys / hjkl
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }),  { description = "Move focus to the left" })
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }), { description = "Move focus to the right" })
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }),    { description = "Move focus upwards" })
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }),  { description = "Move focus downwards" })
hl.bind(mainMod .. " + H", hl.dsp.focus({ direction = "left" }),  { description = "Move focus to the left" })
hl.bind(mainMod .. " + L", hl.dsp.focus({ direction = "right" }), { description = "Move focus to the right" })
hl.bind(mainMod .. " + J", hl.dsp.focus({ direction = "up" }),    { description = "Move focus upwards" })
hl.bind(mainMod .. " + K", hl.dsp.focus({ direction = "down" }),  { description = "Move focus downwards" })

-- Move workspace between monitors
hl.bind(mainMod .. " + SHIFT + h", hl.dsp.workspace.move({ monitor = "l" }), { description = "Move workspace to the left monitor" })
hl.bind(mainMod .. " + SHIFT + l", hl.dsp.workspace.move({ monitor = "r" }), { description = "Move workspace to the right monitor" })

-- Resizing windows: enter a resize submap.
-- https://wiki.hypr.land/Configuring/Binds/#submaps
hl.bind(mainMod .. " + SHIFT + R", hl.dsp.submap("resize"), { description = "Activates window resizing mode" })

hl.define_submap("resize", function()
    hl.bind("right", hl.dsp.window.resize({ x = 15,  y = 0,   relative = true }), { description = "Resize to the right (resizing mode)" })
    hl.bind("left",  hl.dsp.window.resize({ x = -15, y = 0,   relative = true }), { description = "Resize to the left (resizing mode)" })
    hl.bind("up",    hl.dsp.window.resize({ x = 0,   y = -15, relative = true }), { description = "Resize upwards (resizing mode)" })
    hl.bind("down",  hl.dsp.window.resize({ x = 0,   y = 15,  relative = true }), { description = "Resize downwards (resizing mode)" })
    hl.bind("l",     hl.dsp.window.resize({ x = 15,  y = 0,   relative = true }), { description = "Resize to the right (resizing mode)" })
    hl.bind("h",     hl.dsp.window.resize({ x = -15, y = 0,   relative = true }), { description = "Resize to the left (resizing mode)" })
    hl.bind("k",     hl.dsp.window.resize({ x = 0,   y = -15, relative = true }), { description = "Resize upwards (resizing mode)" })
    hl.bind("j",     hl.dsp.window.resize({ x = 0,   y = 15,  relative = true }), { description = "Resize downwards (resizing mode)" })
    hl.bind("escape", hl.dsp.submap("reset"), { description = "Ends window resizing mode" })
end)

-- Resize/move window with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize()) -- Resize the window towards a direction
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag())   -- Drag window

-- Move active window to a workspace with mainMod + CTRL + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + CTRL + " .. key, hl.dsp.window.move({ workspace = i }), { description = "Move window and switch to workspace " .. i })
end
hl.bind(mainMod .. " + CTRL + left",  hl.dsp.window.move({ workspace = "-1" }), { description = "Move window and switch to the next workspace" })
hl.bind(mainMod .. " + CTRL + right", hl.dsp.window.move({ workspace = "+1" }), { description = "Move window and switch to the previous workspace" })

-- Same as above, but doesn't switch to the workspace (silent)
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }), { description = "Move window silently to workspace " .. i })
end

-- ======= Workspace Actions =======

-- Switch workspaces with mainMod + [0-9]
for i = 1, 10 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i }), { description = "Switch to workspace " .. i })
end

-- Move to next/prev workspace
hl.bind(mainMod .. " + ALT + left",  hl.dsp.focus({ workspace = "-1" }), { description = "Switch to the next workspace" })
hl.bind(mainMod .. " + ALT + right", hl.dsp.focus({ workspace = "+1" }), { description = "Switch to the previous workspace" })
hl.bind(mainMod .. " + ALT + h",     hl.dsp.focus({ workspace = "-1" }), { description = "Switch to the next workspace" })
hl.bind(mainMod .. " + ALT + l",     hl.dsp.focus({ workspace = "+1" }), { description = "Switch to the previous workspace" })

-- Special workspaces (scratchpads)
hl.bind(mainMod .. " + minus", hl.dsp.window.move({ workspace = "special" }),  { description = "Move active window to Special workspace" })
hl.bind(mainMod .. " + equal", hl.dsp.workspace.toggle_special("special"),     { description = "Toggles the Special workspace" })
hl.bind(mainMod .. " + F1",    hl.dsp.workspace.toggle_special("scratchpad"),  { description = "Call special workspace scratchpad" })
hl.bind(mainMod .. " + ALT + SHIFT + F1", hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }), { description = "Move active window to special workspace scratchpad" })

-- ======= Additional Settings =======
-- https://wiki.hypr.land/Configuring/Basics/Binds/
-- hl.config({
--     binds = {
--         workspace_center_on            = 1,
--         movefocus_cycles_fullscreen    = true,
--         window_direction_monitor_fallback = true,
--     },
-- })
