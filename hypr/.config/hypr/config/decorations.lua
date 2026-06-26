-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                    Decorations Configuration                ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Colors are available here (decorations.conf used to `source` colors.conf).
-- Currently unused — blur/shadow are disabled — but kept for parity.
local colors = require("config.colors")

-- https://wiki.hypr.land/Configuring/Basics/Variables/#decoration
hl.config({
    decoration = {
        active_opacity = 1,
        rounding       = 0,

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#blur
        blur = {
            enabled = false,
        },

        -- https://wiki.hypr.land/Configuring/Basics/Variables/#shadow
        shadow = {
            enabled = false,
        },
    },
})
