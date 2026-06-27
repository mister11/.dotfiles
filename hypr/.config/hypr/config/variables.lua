-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Variables / General Config                 ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Sourced for parity with the old .conf structure (values are unused here)
require("config.colors")

hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,
        layout   = "dwindle",
        ["col.active_border"] = "rgb(98971a)",
    },
    group = {
        auto_group = false,
        groupbar = {
            enabled = true,
        },
    },
    misc = {
        font_family        = "JetBrainsMono Nerd Font Mono",
        splash_font_family = "JetBrainsMono Nerd Font Mono",
        disable_hyprland_logo = true,
        focus_on_activate     = true,
        vrr                   = 2,
    },
    render = {
        direct_scanout = 2,
    },
    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },
})
