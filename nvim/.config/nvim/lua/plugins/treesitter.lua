return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    build = ":TSUpdate",
    dependencies = {
        "nvim-treesitter/nvim-treesitter-textobjects"
    },
    config = function()
        local configs = require("nvim-treesitter.configs")

        configs.setup({
            ensure_installed = "all",
            sync_install = false,
            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
                disable = { "csv" }
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
                -- NOTE: enabling indentation significantly slows down editing in Dart files
                disable = { 'dart' }
            },
            textobjects = {
                select = {
                    enable = true,
                },
                swap = {
                    enable = true,
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = "@function.outer"
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer"
                    },
                }
            }
        })
    end
}
