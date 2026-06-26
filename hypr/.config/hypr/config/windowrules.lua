-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Windowrules Configuration                ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Window rules https://wiki.hypr.land/Configuring/Basics/Window-Rules/

-- Float necessary windows
hl.window_rule({
    name  = "windowrule-1",
    match = { class = "^(org.pulseaudio.pavucontrol)" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-2",
    match = { class = "^()$", title = "^(Picture in picture)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-3",
    match = { class = "^()$", title = "^(Save File)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-4",
    match = { class = "^()$", title = "^(Open File)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-6",
    match = { class = "^(blueman-manager)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-7",
    match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-8",
    match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org.org.kde.polkit-kde-authentication-agent-1)(.*)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-9",
    match = { class = "^(CachyOSHello)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-10",
    match = { class = "^(zenity)$" },
    float = true,
})

hl.window_rule({
    name  = "windowrule-11",
    match = { class = "^()$", title = "^(Steam - Self Updater)$" },
    float = true,
})

-- Commented-out examples carried over from windowrules.conf for reference:
--
-- hl.window_rule({ name = "thunar-opacity", match = { class = "^(thunar|nemo)$" }, opacity = 0.92 })
-- hl.window_rule({ name = "pip-float",      match = { title = "^(Picture-in-Picture)$" }, float = true, size = "960 540", move = "25%-" })
-- hl.window_rule({ name = "firefox-noblur", match = { class = "^(org.mozilla.firefox)$" }, no_blur = true })
--
-- Decorations for floating vs tiling windows on workspaces 1..10:
-- hl.window_rule({ name = "float-deco",  match = { float = true,  workspace = "w[fv1-10]" }, border_size = 2, border_color = "rgba(01ccffff)", rounding = 8 })
-- hl.window_rule({ name = "tiled-deco",  match = { float = false, workspace = "f[1-10]" },   border_size = 3, rounding = 4 })

-- Workspace rules https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- hl.workspace_rule({ workspace = "1", default = true, monitor = "eDP-1" })
-- hl.workspace_rule({ workspace = "r[1-5]",  monitor = "eDP-1" })
-- hl.workspace_rule({ workspace = "special:scratchpad", on_created_empty = "rofi -show drun -display-drun" })
-- "Smart gaps":
-- hl.workspace_rule({ workspace = "w[tv1-10]", gaps_out = 5, gaps_in = 3 })

-- Layer rules:
-- hl.layer_rule({ name = "waybar-anim",     match = { namespace = "^waybar$" },    animation = "slide down" })
-- hl.layer_rule({ name = "wallpaper-anim",  match = { namespace = "^wallpaper$" },  animation = "fade 50%" })
