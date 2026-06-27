-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Keybinds                            ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

local defaults = require("config.defaults")

local mainMod = "SUPER"

-- ━━━━━━━━━━━━━━ Application launchers ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+RETURN",
    hl.dsp.exec_cmd(defaults.terminal),
    { description = "Opens your preferred terminal emulator (" .. defaults.terminal .. ")" })
hl.bind(mainMod .. "+E",
    hl.dsp.exec_cmd(defaults.filemanager),
    { description = "Opens your preferred filemanager (" .. defaults.filemanager .. ")" })
hl.bind(mainMod .. "+A",
    hl.dsp.exec_cmd(defaults.capturing),
    { description = "Screen capture selection" })

-- ━━━━━━━━━━━━━━ Window actions ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+SHIFT+Q",
    hl.dsp.window.close(),
    { description = "Closes (not kill) current window" })
hl.bind(mainMod .. "+SHIFT+M",
    hl.dsp.exec_cmd([[loginctl terminate-user ""]]),
    { description = "Exits Hyprland by terminating the user sessions" })
hl.bind(mainMod .. "+F",
    hl.dsp.window.float({ action = "toggle" }),
    { description = "Switches current window between floating and tiling mode" })
hl.bind(mainMod .. "+CTRL+F",
    hl.dsp.window.fullscreen(),
    { description = "Toggles current window fullscreen mode" })
hl.bind(mainMod .. "+COMMA",
    hl.dsp.layout("togglesplit"),
    { description = "Toggles current window split mode" })

-- ━━━━━━━━━━━━━━ Mako notifications ━━━━━━━━━━━━━━
hl.bind("CTRL+SPACE",  hl.dsp.exec_cmd("makoctl dismiss"),  { description = "" })
hl.bind("CTRL+GRAVE", hl.dsp.exec_cmd("makoctl restore"),  { description = "" })

-- ━━━━━━━━━━━━━━ Clipboard ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+SHIFT+V", hl.dsp.exec_cmd("$HOME/.local/bin/paste_from_clipboard_hypr"))

-- ━━━━━━━━━━━━━━ Gap toggles ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+SHIFT+G",
    hl.dsp.exec_cmd([[hyprctl --batch "keyword general:gaps_out 5;keyword general:gaps_in 3"]]),
    { description = "Set CachyOS default gaps" })
hl.bind(mainMod .. "+G",
    hl.dsp.exec_cmd([[hyprctl --batch "keyword general:gaps_out 0;keyword general:gaps_in 0"]]),
    { description = "Remove gaps between window" })

-- ━━━━━━━━━━━━━━ Volume control (repeating) ━━━━━━━━━━━━━━
hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ +5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{if($1>100) system("pactl set-sink-volume @DEFAULT_SINK@ 100%")}' && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]),
    { repeating = true, description = "Raise Volume" })
hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd([[pactl set-sink-volume @DEFAULT_SINK@ -5% && pactl get-sink-volume @DEFAULT_SINK@ | grep -oP '\d+(?=%)' | awk '{print $1}' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]),
    { repeating = true, description = "Lower Volume" })
hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd([[amixer sset Master toggle | sed -En '/\[on\]/ s/.*\[([0-9]+)%\].*/\1/ p; /\[off\]/ s/.*/0/p' | head -1 > /tmp/$HYPRLAND_INSTANCE_SIGNATURE.wob]]),
    { repeating = true, description = "Mutes player audio" })

-- ━━━━━━━━━━━━━━ Playback control ━━━━━━━━━━━━━━
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { description = "Toggles play/pause" })
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"),     { description = "Next track" })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { description = "Previous track" })

-- ━━━━━━━━━━━━━━ Screen brightness (repeating) ━━━━━━━━━━━━━━
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl s +5%"),
    { repeating = true, description = "Increases brightness 5%" })
hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl s 5%-"),
    { repeating = true, description = "Decreases brightness 5%" })

-- ━━━━━━━━━━━━━━ Utility binds ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+SHIFT+P",
    hl.dsp.exec_cmd("gnome-calculator"),
    { description = "Runs the calculator application" })
hl.bind(mainMod .. "+Q",
    hl.dsp.exec_cmd("swaylock-fancy -e -K -p 10 -f Hack-Regular"),
    { description = "Lock the screen" })
hl.bind(mainMod .. "+O",
    hl.dsp.exec_cmd("killall -SIGUSR2 waybar"),
    { description = "Reload/restarts Waybar" })

-- ━━━━━━━━━━━━━━ Move window towards a direction ━━━━━━━━━━━━━━
for _, key in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(mainMod .. "+CTRL+SHIFT+" .. key:upper(),
        hl.dsp.window.move({ direction = key }),
        { description = "Move active window " .. key })
end
hl.bind(mainMod .. "+CTRL+SHIFT+H", hl.dsp.window.move({ direction = "left" }),  { description = "Move active window to the left" })
hl.bind(mainMod .. "+CTRL+SHIFT+L", hl.dsp.window.move({ direction = "right" }), { description = "Move active window to the right" })
hl.bind(mainMod .. "+CTRL+SHIFT+J", hl.dsp.window.move({ direction = "up" }),    { description = "Move active window upwards" })
hl.bind(mainMod .. "+CTRL+SHIFT+K", hl.dsp.window.move({ direction = "down" }),  { description = "Move active window downwards" })

-- ━━━━━━━━━━━━━━ Move focus with mainMod + arrow keys / HJKL ━━━━━━━━━━━━━━
for _, key in ipairs({ "left", "right", "up", "down" }) do
    hl.bind(mainMod .. "+" .. key:upper(),
        hl.dsp.focus({ direction = key }),
        { description = "Move focus " .. key })
end
hl.bind(mainMod .. "+H", hl.dsp.focus({ direction = "left" }),  { description = "Move focus to the left" })
hl.bind(mainMod .. "+L", hl.dsp.focus({ direction = "right" }), { description = "Move focus to the right" })
hl.bind(mainMod .. "+J", hl.dsp.focus({ direction = "up" }),    { description = "Move focus upwards" })
hl.bind(mainMod .. "+K", hl.dsp.focus({ direction = "down" }),  { description = "Move focus downwards" })

-- ━━━━━━━━━━━━━━ Move workspace between monitors ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+SHIFT+h",
    hl.dsp.workspace.move({ monitor = "l" }),
    { description = "Move workspace to the left monitor" })
hl.bind(mainMod .. "+SHIFT+l",
    hl.dsp.workspace.move({ monitor = "r" }),
    { description = "Move worksapce to the right monitor" })

-- ━━━━━━━━━━━━━━ Resize submap ━━━━━━━━━━━━━━
hl.define_submap("resize", function()
    local resizeOpts = { repeating = true }

    hl.bind("right", hl.dsp.window.resize({ x = 15,  y = 0, relative = true }), resizeOpts)
    hl.bind("left",  hl.dsp.window.resize({ x = -15, y = 0, relative = true }), resizeOpts)
    hl.bind("up",    hl.dsp.window.resize({ x = 0, y = -15, relative = true }), resizeOpts)
    hl.bind("down",  hl.dsp.window.resize({ x = 0, y = 15,  relative = true }), resizeOpts)
    hl.bind("l",     hl.dsp.window.resize({ x = 15,  y = 0, relative = true }), resizeOpts)
    hl.bind("h",     hl.dsp.window.resize({ x = -15, y = 0, relative = true }), resizeOpts)
    hl.bind("k",     hl.dsp.window.resize({ x = 0, y = -15, relative = true }), resizeOpts)
    hl.bind("j",     hl.dsp.window.resize({ x = 0, y = 15,  relative = true }), resizeOpts)
    hl.bind("escape", hl.dsp.submap("reset"), { description = "Ends window resizing mode" })
end)

hl.bind(mainMod .. "+SHIFT+R",
    hl.dsp.submap("resize"),
    { description = "Activates window resizing mode" })

-- ━━━━━━━━━━━━━━ Mouse window actions ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+mouse:273", hl.dsp.window.resize(), { drag = true })
hl.bind(mainMod .. "+mouse:272", hl.dsp.window.drag(),  { drag = true })

-- ━━━━━━━━━━━━━━ Move window to workspace (and switch) ━━━━━━━━━━━━━━
for i = 1, 9 do
    hl.bind(mainMod .. "+CTRL+" .. i,
        hl.dsp.window.move({ workspace = tostring(i) }),
        { description = "Move window and switch to workspace " .. i })
end
hl.bind(mainMod .. "+CTRL+0",
    hl.dsp.window.move({ workspace = "10" }),
    { description = "Move window and switch to workspace 10" })

hl.bind(mainMod .. "+CTRL+left",
    hl.dsp.window.move({ workspace = "-1" }),
    { description = "Move window and switch to the next workspace" })
hl.bind(mainMod .. "+CTRL+right",
    hl.dsp.window.move({ workspace = "+1" }),
    { description = "Move window and switch to the previous workspace" })

-- ━━━━━━━━━━━━━━ Move window silently to workspace ━━━━━━━━━━━━━━
for i = 1, 9 do
    hl.bind(mainMod .. "+SHIFT+" .. i,
        hl.dsp.window.move({ workspace = tostring(i), follow = false }),
        { description = "Move window silently to workspace " .. i })
end
hl.bind(mainMod .. "+SHIFT+0",
    hl.dsp.window.move({ workspace = "10", follow = false }),
    { description = "Move window silently to workspace 10" })

-- ━━━━━━━━━━━━━━ Switch workspace ━━━━━━━━━━━━━━
for i = 1, 9 do
    hl.bind(mainMod .. "+" .. i,
        hl.dsp.focus({ workspace = tostring(i) }),
        { description = "Switch to workspace " .. i })
end
hl.bind(mainMod .. "+0",
    hl.dsp.focus({ workspace = "10" }),
    { description = "Switch to workspace 10" })

hl.bind(mainMod .. "+ALT+left",
    hl.dsp.focus({ workspace = "-1" }),
    { description = "Switch to the next workspace" })
hl.bind(mainMod .. "+ALT+right",
    hl.dsp.focus({ workspace = "+1" }),
    { description = "Switch to the previous workspace" })
hl.bind(mainMod .. "+ALT+h",
    hl.dsp.focus({ workspace = "-1" }),
    { description = "Switch to the next workspace" })
hl.bind(mainMod .. "+ALT+l",
    hl.dsp.focus({ workspace = "+1" }),
    { description = "Switch to the previous workspace" })

-- ━━━━━━━━━━━━━━ Special workspaces ━━━━━━━━━━━━━━
hl.bind(mainMod .. "+minus",
    hl.dsp.window.move({ workspace = "special" }),
    { description = "Move active window to Special workspace" })
hl.bind(mainMod .. "+equal",
    hl.dsp.workspace.toggle_special("special"),
    { description = "Toggles the Special workspace" })
hl.bind(mainMod .. "+F1",
    hl.dsp.workspace.toggle_special("scratchpad"),
    { description = "Call special workspace scratchpad" })
hl.bind(mainMod .. "+ALT+SHIFT+F1",
    hl.dsp.window.move({ workspace = "special:scratchpad", follow = false }),
    { description = "Move active window to special workspace scratchpad" })
