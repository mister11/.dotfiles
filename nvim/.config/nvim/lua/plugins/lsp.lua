return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        vim.lsp.handlers["textdocument/publishdiagnostics"] = vim.lsp.with(
            vim.lsp.diagnostic.on_publish_diagnostics, {
                update_in_insert = true,
            })

        NnoremapGlobal('<leader>eo', vim.diagnostic.open_float)
        NnoremapGlobal('<leader>en', vim.diagnostic.goto_prev)
        NnoremapGlobal('<leader>ep', vim.diagnostic.goto_next)
        NnoremapGlobal('<leader>eq', vim.diagnostic.setloclist)

        local lsp_attach = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

            Nnoremap('gD', vim.lsp.buf.declaration)
            Nnoremap('gd', vim.lsp.buf.definition)
            Nnoremap('K', vim.lsp.buf.hover)
            Nnoremap('<leader>li', vim.lsp.buf.implementation)
            Nnoremap('<leader>ls', vim.lsp.buf.signature_help)
            Inoremap('<C-k>', vim.lsp.buf.signature_help)
            Nnoremap('<leader>ltd', vim.lsp.buf.type_definition)
            Nnoremap('<leader>lr', vim.lsp.buf.rename)
            Nnoremap('<leader>la', vim.lsp.buf.code_action)
            Nnoremap('<leader>lu', vim.lsp.buf.references)
            Nnoremap('<leader>lf', function() vim.lsp.buf.format { async = true } end)

            if client.server_capabilities.inlayHintProvider then
                vim.lsp.inlay_hint.enable(bufnr, true)
            end
        end

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'astro',
                'bashls',
                -- 'elixirls',
                'emmet_ls',
                'gopls',
                'html',
                'jsonls',
                'lua_ls',
                'pyright',
                'rust_analyzer',
                'svelte',
                'terraformls',
                'tailwindcss',
                'tsserver',
                'yamlls',
            }
        })

        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lspconfig = require('lspconfig')


        local lsp_configs = require('lspconfig.configs')


        local lexical_config = {
            filetypes = { "elixir", "eelixir", "heex" },
            cmd = { "/home/mister11/dev/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
            settings = {},
        }

        if not lsp_configs.lexical then
            lsp_configs.lexical = {
                default_config = {
                    filetypes = lexical_config.filetypes,
                    cmd = lexical_config.cmd,
                    root_dir = function(fname)
                        return lspconfig.util.root_pattern("mix.exs", ".git")(fname) or vim.loop.os_homedir()
                    end,
                    -- optional settings
                    settings = lexical_config.settings,
                },
            }
        end

        lspconfig.lexical.setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
        })


        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                })
            end,
            ["gopls"] = function()
                lspconfig.gopls.setup {
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                    cmd = { "gopls", "serve" },
                    filetypes = { "go", "gomod" },
                    settings = {
                        gopls = {
                            analyses = {
                                unusedparams = true,
                            },
                            staticcheck = true,
                        },
                    },
                }
            end,
            ["tailwindcss"] = function()
                lspconfig.tailwindcss.setup {
                    init_options = {
                        userLanguages = {
                            heex = "html-eex",
                        },
                    },
                    root_dir = lspconfig.util.root_pattern("mix.exs", ".git")
                }
            end
        })
    end,
}
