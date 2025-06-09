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
                'sqlls',
                'svelte',
                'terraformls',
                'tailwindcss',
                'ts_ls',
                'vue_ls',
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

        vim.lsp.config('lexical', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            filetypes = lexical_config.filetypes,
            cmd = lexical_config.cmd,
            root_dir = function(bufnr, on_dir)
                local fname = vim.api.nvim_buf_get_name(bufnr)
                local matches = vim.fs.find({ 'mix.exs' }, { upward = true, limit = 2, path = fname })
                local child_or_root_path, maybe_umbrella_path = unpack(matches)
                local root_dir = vim.fs.dirname(maybe_umbrella_path or child_or_root_path)

                on_dir(root_dir)
            end,
            -- optional settings
            settings = lexical_config.settings,
        })
        vim.lsp.enable('lexical')

        vim.lsp.config('sqlls', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
        })

        vim.lsp.config['kotlinls'] = {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            cmd = { '/home/mister11/dev/support/kotlin/kotlin-lsp.sh', '--stdio' },
            filetypes = { 'kotlin' },
            single_file_support = true,
            root_markers = { "build.gradle", "build.gradle.kts" },
            settings = {}
        }
        vim.lsp.enable('kotlinls')

        vim.lsp.config('svelte', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
        })

        vim.lsp.config('jsonls', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
        })

        vim.lsp.config('lua_ls', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
        })

        vim.lsp.config('ts_ls', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            init_options = {
                plugins = {
                    {
                        name = '@vue/typescript-plugin',
                        location = vim.fn.stdpath 'data' ..
                            '/mason/packages/vue-language-server/node_modules/@vue/language-server',
                        languages = { "typescript", "javascript", "vue" },
                    },
                },
            },
            filetypes = {
                "javascript",
                "typescript",
                "vue",
            },
        })

        vim.lsp.config('svelte', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities
        })

        vim.lsp.config('gopls', {
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
        })

        vim.lsp.config('html', {
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
            filetypes = { "html", "heex", "elixir-heex" },
        })

        vim.lsp.config('pyright', {
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
    end,
}
