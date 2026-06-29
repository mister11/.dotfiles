-- send to D-bus activation env
hl.env("HYPRCURSOR_SIZE", "24", true)
hl.env("XCURSOR_SIZE", "24", true)
hl.env("QT_CURSOR_SIZE", "24", true)

hl.env("QT_QPA_PLATFORMTHEME",             "qt6ct")
hl.env("QT_QPA_PLATFORM",                  "wayland")
hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
