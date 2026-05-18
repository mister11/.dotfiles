return {
    'nvimtools/none-ls.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
    },
    opts = function()
        local null_ls = require("null-ls")
        return {
            sources = {
                null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.sqlfluff.with({
                    extra_args = { "--dialect", "postgres" }, -- change to your dialect
                }),
            }
        }
    end
}
