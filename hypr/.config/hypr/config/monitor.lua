-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                     Monitor Configuration                   ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
--
-- NOTE: just like the old config/monitor.conf, this file is NOT required by
-- hyprland.lua — monitors.lua (the nwg-displays output) is loaded instead.
-- Kept as a converted reference / fallback generic monitor setup.

-- https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1.5",
})

-- If you need to scale things like steam etc, this unscales XWayland.
-- Adjust GDK_SCALE accordingly to your liking.
hl.config({
    xwayland = {
        force_zero_scaling = true, -- Unscale XWayland
    },
})

hl.env("GDK_SCALE", "1.25") -- GDK Scaling Factor
