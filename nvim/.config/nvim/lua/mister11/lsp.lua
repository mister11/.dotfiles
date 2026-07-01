-- global config (if needed)
vim.lsp.config('*', {})
--

-- ensure all LSPs are installed
-- IMPROVEMENT IDEA: remove nvim-lspconfig, copy all configs to lsp/ manually, read that folder and install + enable these
--   - it sound better than having only some LSPs in after/lsp/ depending on additional config requirements + using after/ to make sure they are working (due to nvim-lspconfig)
-- also, I want to use mason-lspconfig since it uses same names as the filenames in after/lsp; if I'd want to do it without it, I'd have to use real LSP names and have mapping
require('mason-lspconfig').setup({
    -- I want to control enablement of LSPs
    automatic_enable = false,
    ensure_installed = {
        'bashls',
        'elp',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'ruff',
        'sqls',
        'terraformls',
        'tailwindcss',
        'ts_ls',
        'ty',
        'vue_ls',
        'yamlls',
    }
})

-- enable all installed (using Mason) LSPs
local installedPacks = require("mason-registry").get_installed_packages()

local lspNames = vim.iter(installedPacks):fold({}, function(acc, pack)
    table.insert(acc, pack.spec.neovim and pack.spec.neovim.lspconfig)
    return acc
end)

vim.lsp.enable(lspNames)
--

-- enable custom built LSPs
-- vim.lsp.enable('lexical')
vim.lsp.enable('expert')
vim.lsp.enable('kotlin_lsp')
--

vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(args)
        local client = vim.lsp.get_client_by_id(args.data.client_id)

        -- this exists, but blink works better
        -- let's see how it develops
        -- needs vim.opt.completeopt adjustments
        --
        -- if client:supports_method("textDocument/completion", bufnr) then
        --     print("Completion enabled")
        --     vim.lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
        -- end

        Nmap('<leader>e', vim.diagnostic.open_float)
        Nmap('[d', function()
            vim.diagnostic.goto_prev()
            vim.cmd('normal! zz')
        end)
        Nmap(']d', function()
            vim.diagnostic.goto_next()
            vim.cmd('normal! zz')
        end)

        Nmap('gD', vim.lsp.buf.declaration, { buf = args.buf })
        Nmap('gd', "<cmd>FzfLua lsp_definitions<cr>", { buf = args.buf })
        Nmap('gr', function() require("fzf-lua").lsp_references({ includeDeclaration = false }) end, { buf = args.buf })
        Nmap('gs', "<cmd>FzfLua lsp_document_symbols<cr>", { buf = args.buf })
        Nmap('K', vim.lsp.buf.hover, { buf = args.buf })
        Nmap('<leader>li', vim.lsp.buf.implementation, { buf = args.buf })
        Nmap('<leader>ls', vim.lsp.buf.signature_help, { buf = args.buf })
        Imap('<C-k>', vim.lsp.buf.signature_help, { buf = args.buf })
        Nmap('<leader>ltd', vim.lsp.buf.type_definition, { buf = args.buf })
        Nmap('<leader>lr', vim.lsp.buf.rename, { buf = args.buf })
        Nmap('<leader>la', vim.lsp.buf.code_action, { buf = args.buf })
        Nmap('<leader>lf', function() vim.lsp.buf.format { async = true } end, { buf = args.buf })

        if client.server_capabilities.inlayHintProvider then
            vim.lsp.inlay_hint.enable(true, { bufnr = args.buf })
        end
    end,
})
