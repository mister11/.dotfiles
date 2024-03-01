return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        {
            'L3MON4D3/LuaSnip',
            build = (function()
                -- Build Step is needed for regex support in snippets
                -- This step is not supported in many windows environments
                -- Remove the below condition to re-enable on windows
                if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
                    return
                end
                return 'make install_jsregexp'
            end)(),
        },
        "saadparwaiz1/cmp_luasnip"
    },
    config = function()
        local luasnip = require('luasnip')
        local cmp = require('cmp')
        cmp.setup {
            snippet = {
                expand = function(args)
                    luasnip.lsp_expand(args.body)
                end,
            },
            completion = { completeopt = 'menu,menuone,noinsert' },
            mapping = {
                ['<c-p>'] = cmp.mapping.select_prev_item(),
                ['<c-n>'] = cmp.mapping.select_next_item(),
                ['<c-d>'] = cmp.mapping.scroll_docs(-4),
                ['<c-u>'] = cmp.mapping.scroll_docs(4),
                ['<c-space>'] = cmp.mapping.complete(),
                ['<c-e>'] = cmp.mapping.close(),
                ['<cr>'] = cmp.mapping.confirm {
                    behavior = cmp.ConfirmBehavior.replace
                },
                ['<C-l>'] = cmp.mapping(function()
                    if luasnip.expand_or_locally_jumpable() then
                        luasnip.expand_or_jump()
                    end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                    if luasnip.locally_jumpable(-1) then
                        luasnip.jump(-1)
                    end
                end, { 'i', 's' }),
            },
            sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'buffer' },
                { name = 'path' },
            }
        }

        luasnip.add_snippets("all", {
            luasnip.parser.parse_snippet(
                "eex",
                "<%= ${1:val} %>"
            ),
        })

        luasnip.add_snippets("elixir", {
            luasnip.parser.parse_snippet(
                "fn",
                "def ${1:func_name}(${2:args}) do\n\t${0}\nend"
            )
        })

        luasnip.add_snippets("elixir", {
            luasnip.parser.parse_snippet(
                "fni",
                "def ${1:func_name}(${2:args}), do: ${0}"
            )
        })
    end
}
