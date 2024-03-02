return {
    "nvim-treesitter/nvim-treesitter",
    tag = "v0.9.2",
    build = ":TSUpdate",
    config = function()
        local configs = require("nvim-treesitter.configs")
        local filetypes = {
            'html', 'javascript', 'typescript', 'javascriptreact', 'typescriptreact', 'svelte', 'vue', 'tsx', 'jsx',
            'rescript',
            'xml',
            'php',
            'markdown',
            'astro', 'glimmer', 'handlebars', 'hbs',
            'heex'
        }

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
                enable = true
            },
            autotag = {
                enable = true,
                filetypes = filetypes,
            }
        })
    end
}
