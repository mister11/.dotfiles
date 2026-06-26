-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                 CachyOS Hyprland Configuration              ┃
-- ┃                        (Lua edition)                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
--
-- Hyprland loads hyprland.lua INSTEAD of hyprland.conf when this file exists
-- (>= 0.55). The original .conf files are left untouched as a fallback —
-- delete or rename this file to fall back to the hyprlang config.
--
-- Lua modules don't share locals across `require`, so the old `$var`
-- substitutions live in table modules:
--   config/defaults.lua  — programs + mainMod (was $mainMod, $terminal, ...)
--   config/colors.lua    — the $cachy* palette
--
-- NOTE: hyprlock.conf and hyprpaper.conf are read by separate binaries
-- (hyprlock / hyprpaper) that still use hyprlang — they are intentionally
-- NOT ported to Lua.

-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                         Source Files                        ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
-- `source =` becomes Lua `require(...)`. Hyprland runs with cwd at the
-- config root, so "config.input" resolves to ./config/input.lua.
require("config.animations")
require("config.autostart")
require("config.decorations")
require("config.environment")
require("config.input")
require("config.keybinds")
require("monitors")
require("config.variables")
require("config.windowrules")

-- Like the original, config/monitor.lua and workspaces.lua are NOT required
-- (monitors.lua is used for displays). Add them here if you want them loaded:
-- require("config.monitor")
-- require("workspaces")

-- Modifying these configs can be done by creating a user defined config, e.g.
-- ~/.config/hypr/config/user-config.lua
-- require("config.user-config")
