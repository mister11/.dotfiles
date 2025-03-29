return {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
        local luasnip = require('luasnip')

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

        luasnip.add_snippets("go", {
            luasnip.parser.parse_snippet(
                "errr",
                "if err != nil {\n\treturn err\n}"
            )
        })

        luasnip.add_snippets("go", {
            luasnip.parser.parse_snippet(
                "errm",
                "if err != nil {\n\treturn ${1:return_value}, err\n}"
            )
        })

        require("luasnip.loaders.from_vscode").lazy_load()
    end
}
