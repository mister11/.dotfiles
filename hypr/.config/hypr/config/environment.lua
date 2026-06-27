-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                  Environment Variables Setup                  ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- envd semantics: only set if currently unset
local default_envs = {
    HYPRCURSOR_SIZE = "24",
    XCURSOR_SIZE    = "24",
    QT_CURSOR_SIZE  = "24",
}

for name, value in pairs(default_envs) do
    if os.getenv(name) == nil then
        hl.env(name, value)
    end
end

hl.env("QT_QPA_PLATFORMTHEME",             "qt6ct")
hl.env("QT_QPA_PLATFORM",                  "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
