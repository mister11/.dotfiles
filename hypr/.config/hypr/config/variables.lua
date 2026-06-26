-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Variables Configuration                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Color palette is available here (variables.conf used to `source` colors.conf).
-- The active border below uses a literal gruvbox green; swap in e.g.
-- `colors.cachylblue` if you want one of the palette entries instead.
local colors = require("config.colors")

hl.config({
    general = {
        gaps_in  = 0,
        gaps_out = 0,
        layout   = "dwindle", -- master|dwindle

        col = {
            active_border = "rgb(98971a)",
        },
    },

    -- This is the tabs config — but unlike i3 it's worse, since you have to
    -- manually add every window to the group. For my use case, full screen of
    -- a particular window is better/enough.
    group = {
        auto_group = false,
        groupbar = {
            enabled = true,
        },
    },

    misc = {
        font_family           = "JetBrainsMono Nerd Font Mono",
        splash_font_family    = "JetBrainsMono Nerd Font Mono",
        disable_hyprland_logo = true,
        focus_on_activate     = true,
        vrr                   = 2,
    },

    render = {
        direct_scanout = 2,
    },

    -- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
    dwindle = {
        force_split    = 2,
        preserve_split = true,
    },
})
