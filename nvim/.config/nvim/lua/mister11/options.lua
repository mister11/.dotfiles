vim.g.mapleader = " "

vim.g.undotree_SetFocusWhenToggle = 1

vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.completeopt = "menuone,preview"
vim.opt.relativenumber = true
vim.opt.showmatch = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.number = true
vim.opt.incsearch = true
vim.opt.wildmode = "full"
vim.opt.autoindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.hlsearch = false
vim.opt.undofile = true
vim.opt.hidden = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.showmode = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.cmd [[
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
]]
