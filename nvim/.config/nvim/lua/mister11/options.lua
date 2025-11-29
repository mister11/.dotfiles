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

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        if client.name == "rust-analyzer" then
            vim.api.nvim_buf_set_option(args.buf, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            Nnoremap('gD', vim.lsp.buf.declaration)
            Nnoremap('gd', "<cmd>Telescope lsp_definitions<cr>")
            Nnoremap('gr', "<cmd>Telescope lsp_references<cr>")
            Nnoremap('gs', "<cmd>Telescope lsp_document_symbols<cr>")
            Nnoremap('K', vim.lsp.buf.hover)
            Nnoremap('<leader>li', vim.lsp.buf.implementation)
            Nnoremap('<leader>ls', vim.lsp.buf.signature_help)
            Inoremap('<C-k>', vim.lsp.buf.signature_help)
            Nnoremap('<leader>ltd', vim.lsp.buf.type_definition)
            Nnoremap('<leader>lr', vim.lsp.buf.rename)
            Nnoremap('<leader>la', vim.lsp.buf.code_action)
            Nnoremap('<leader>lf', function() vim.lsp.buf.format { async = true } end)

            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
            end
        end
    end,
})

vim.opt.foldcolumn = "0"
vim.opt.fillchars:append({ fold = " " })
