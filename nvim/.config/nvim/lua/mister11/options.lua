vim.g.mapleader = " "

vim.g.undotree_SetFocusWhenToggle = 1

vim.opt.termguicolors = true
vim.opt.splitright = true
vim.opt.splitbelow = true
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
vim.opt.smartcase = true
vim.opt.spelllang = "en_us"
vim.opt.spell = true

vim.o.foldenable = true
vim.o.foldlevel = 99
vim.o.foldmethod = "expr"
vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'

-- Prefer LSP folding if client supports it
-- This did not work (Elixir and Go), but leaving if for the future
-- vim.api.nvim_create_autocmd('LspAttach', {
--     callback = function(args)
--          local client = vim.lsp.get_client_by_id(args.data.client_id)
--          if client:supports_method('textDocument/foldingRange') then
--              print("LSP folding enabled")
--              local win = vim.api.nvim_get_current_win()
--              vim.wo[win][0].foldexpr = 'v:lua.vim.lsp.foldexpr()'
--         end
--     end,
--  })

vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({fold = " "})
