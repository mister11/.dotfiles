return {
    "nvim-treesitter/nvim-treesitter",
    -- tag = "v0.9.3",
    build = ":TSUpdate",
    -- breaks JS for whatever reason, probably should use mini.ai
    -- dependencies = {
    --     "nvim-treesitter/nvim-treesitter-textobjects"
    -- },
    config = function()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = "all",
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },
            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "gnn",
                    node_incremental = "grn",
                    scope_incremental = "grc",
                    node_decremental = "grm",
                },
            },
            indent = {
                enable = true,
                disable = {
                    "dart"
                },
            },
            -- textobjects = {
            --     select = {
            --         enable = true,
            --         lookahead = true,
            --         keymaps = {
            --             ["af"] = "@function.outer",
            --             ["if"] = "@function.inner"
            --         }
            --     }
            -- }
        })
    end
}
