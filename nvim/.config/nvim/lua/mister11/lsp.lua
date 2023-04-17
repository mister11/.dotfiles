vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        update_in_insert = true,
    })

NnoremapGlobal('<leader>eo', vim.diagnostic.open_float)
NnoremapGlobal('<leader>en', vim.diagnostic.goto_prev)
NnoremapGlobal('<leader>ep', vim.diagnostic.goto_next)
NnoremapGlobal('<leader>eq', vim.diagnostic.setloclist)

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = {
        'bashls',
        'elixirls',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'rust_analyzer',
        'terraformls',
        'tsserver',
        'yamlls',
    }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
local lsp_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    Nnoremap('gD', vim.lsp.buf.declaration)
    Nnoremap('gd', vim.lsp.buf.definition)
    Nnoremap('K', vim.lsp.buf.hover)
    Nnoremap('<leader>li', vim.lsp.buf.implementation)
    Nnoremap('<leader>ls', vim.lsp.buf.signature_help)
    Inoremap('<C-h>', vim.lsp.buf.signature_help)
    Nnoremap('<leader>ltd', vim.lsp.buf.type_definition)
    Nnoremap('<leader>lr', vim.lsp.buf.rename)
    Nnoremap('<leader>la', vim.lsp.buf.code_action)
    Nnoremap('<leader>lu', vim.lsp.buf.references)
    Nnoremap('<leader>lf', function() vim.lsp.buf.format { async = true } end)
end

local lspconfig = require('lspconfig')

require('mason-lspconfig').setup_handlers({
    function(server_name)
        lspconfig[server_name].setup({
            on_attach = lsp_attach,
            capabilities = lsp_capabilities,
        })
    end,
    ["gopls"] = function()
        lspconfig.gopls.setup {
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
    end
})

local lspkind = require('lspkind')
local luasnip = require('luasnip')
local cmp = require('cmp')
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = {
        ['<c-p>'] = cmp.mapping.select_prev_item(),
        ['<c-n>'] = cmp.mapping.select_next_item(),
        ['<c-d>'] = cmp.mapping.scroll_docs(-4),
        ['<c-u>'] = cmp.mapping.scroll_docs(4),
        ['<c-space>'] = cmp.mapping.complete(),
        ['<c-e>'] = cmp.mapping.close(),
        ['<cr>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.replace
        }
    },
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer' },
    },
    formatting = {
        format = lspkind.cmp_format({ with_text = true, maxwidth = 50 })
    }
}
require 'luasnip.loaders.from_vscode'.lazy_load()
