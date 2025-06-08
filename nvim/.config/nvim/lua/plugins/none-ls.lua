return {
    'nvimtools/none-ls.nvim',
    opts = function()
        local null_ls = require("null-ls")
        return {
            sources = {
                null_ls.builtins.formatting.black,
                null_ls.builtins.code_actions.gitsigns,
                null_ls.builtins.formatting.prettierd,
                null_ls.builtins.formatting.pg_format
            }
        }
    end
}
