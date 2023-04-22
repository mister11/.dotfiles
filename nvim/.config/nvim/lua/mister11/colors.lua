vim.g.gruvbox_baby_background_color = "dark"
local colors = require("gruvbox-baby.colors").config()
vim.g.gruvbox_baby_highlights = {["@symbol"] = {fg = colors.soft_yellow}}
vim.cmd([[colorscheme gruvbox-baby]])
