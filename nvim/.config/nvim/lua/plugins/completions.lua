return {
    'saghen/blink.cmp',
    dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },

    -- use a release tag to download pre-built binaries
    version = '*',

    opts = {
        keymap = {
            preset = 'default',
            ['<C-y>'] = {},
            ['<CR>'] = { 'accept', 'fallback' },

            ['<Tab>'] = {},
            ['<S-Tab>'] = {},
            ['<C-l>'] = { 'snippet_forward', 'fallback' },
            ['<C-h>'] = { 'snippet_backward', 'fallback' },
        },
        completion = {
            menu = {
                draw = {
                    columns = {
                        { "label",     "label_description", gap = 1 },
                        { "kind_icon", "kind",              gap = 1 }
                    },
                }
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = false
                }
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 200,
            }
        },
        appearance = {
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono'
        },
        snippets = {
            preset = 'luasnip',
        },
        sources = {
            default = { 'lsp', 'snippets', 'buffer', 'path' }
        },
        signature = { enabled = true }
    }
}
