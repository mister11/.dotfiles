-- ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
-- ┃                      Window Rules                             ┃
-- ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛

-- Float necessary windows
hl.window_rule({ match = { class = "^org\\.pulseaudio\\.pavucontrol$" }, float = true })
hl.window_rule({ match = { class = "^$", title = "^Picture in picture$" }, float = true })
hl.window_rule({ match = { class = "^$", title = "^Save File$" },          float = true })
hl.window_rule({ match = { class = "^$", title = "^Open File$" },          float = true })
hl.window_rule({ match = { class = "^blueman-manager$" },                   float = true })
hl.window_rule({
    match = { class = "^(xdg-desktop-portal-gtk|xdg-desktop-portal-kde|xdg-desktop-portal-hyprland)(.*)$" },
    float = true,
})
hl.window_rule({
    match = { class = "^(polkit-gnome-authentication-agent-1|hyprpolkitagent|org\\.org\\.kde\\.polkit-kde-authentication-agent-1)(.*)$" },
    float = true,
})
hl.window_rule({ match = { class = "^CachyOSHello$" }, float = true })
hl.window_rule({ match = { class = "^zenity$" },       float = true })
hl.window_rule({ match = { class = "^$", title = "^Steam - Self Updater$" }, float = true })
