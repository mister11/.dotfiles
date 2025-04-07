return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        NnoremapGlobal('<leader>e', vim.diagnostic.open_float)
        NnoremapGlobal('[d', function()
            vim.diagnostic.goto_prev()
            vim.cmd('normal! zz')
        end)
        NnoremapGlobal(']d', function()
            vim.diagnostic.goto_next()
            vim.cmd('normal! zz')
        end)

        vim.diagnostic.config({ virtual_text = true })

        local lsp_attach = function(client, bufnr)
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

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
                vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
            end
        end

        require('mason').setup()
        require('mason-lspconfig').setup({
            ensure_installed = {
                'astro',
                'bashls',
                'gopls',
                'html',
                'jsonls',
                'lua_ls',
                'pyright',
                'ruff',
                'rust_analyzer',
                'sqls',
                'svelte',
                'terraformls',
                'tailwindcss',
                'ts_ls',
                'yamlls',
            }
        })

        local lsp_capabilities = require('blink.cmp').get_lsp_capabilities()

        local lspconfig = require('lspconfig')

        -- Lexical
        local lsp_configs = require('lspconfig.configs')
        local lexical_config = {
            filetypes = { "elixir", "eelixir", "heex" },
            cmd = { "/home/mister11/dev/support/lexical/_build/dev/package/lexical/bin/start_lexical.sh" },
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

        local flutter = require("flutter-tools")
        flutter.setup {
            lsp = {
                on_attach = lsp_attach
            }
        }

        vim.g.rustaceanvim = {
            server = { on_attach = lsp_attach },
        }

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
            end,
            ["html"] = function()
                lspconfig.html.setup {
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                    filetypes = { "html", "heex", "elixir-heex" }
                }
            end,
            ["pyright"] = function()
                lspconfig.pyright.setup({
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                    settings = {
                        pyright = {
                            -- Using Ruff's import organizer
                            disableOrganizeImports = true,
                        },
                        python = {
                            analysis = {
                                -- Ignore all files for analysis to exclusively use Ruff for linting
                                ignore = { '*' },
                            },
                        },
                    },
                })
            end
        })
    end,
}
