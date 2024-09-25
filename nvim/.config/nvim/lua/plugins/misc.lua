return {
    {
        'kristijanhusak/vim-dadbod-ui',
        dependencies = {
            { 'tpope/vim-dadbod',                     lazy = true },
            { 'kristijanhusak/vim-dadbod-completion', ft = { 'sql', 'mysql', 'plsql' }, lazy = true },
        },
        cmd = {
            'DBUI',
            'DBUIToggle',
            'DBUIAddConnection',
            'DBUIFindBuffer',
        },
        init = function()
            -- Your DBUI configuration
            vim.g.db_ui_use_nerd_fonts = 1
        end,
    },

    -- AI
    {
        "github/copilot.vim",
        config = function()
            vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', {
                expr = true,
                replace_keycodes = false
            })
        end
    },

    -- git
    { "sindrets/diffview.nvim",  dependencies = "nvim-lua/plenary.nvim" },
    { "lewis6991/gitsigns.nvim", config = true },

    -- others
    { "windwp/nvim-autopairs",   config = true },
    {
        "windwp/nvim-ts-autotag",
        opts = {
            aliases = {
                ["heex"] = "html",
                ["elixir"] = "html",
            }
        }
    },

    -- folke :)
    {
        "folke/flash.nvim",

        event = "VeryLazy",
        opts = {
            search = {
                exclude = {
                    "notify",
                    "cmp_menu",
                    "noice",
                    "flash_prompt",
                    -- disable search in nvim-tree
                    "NvimTree",
                    function(win)
                        -- exclude non-focusable windows
                        return not vim.api.nvim_win_get_config(win).focusable
                    end,
                },
            },
            modes = {
                search = {
                    -- disable search on / (if search miss, skips to random place and it's annoying)
                    enabled = false
                }
            }
        },
        keys = {
            { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },
    {
        "nvim-pack/nvim-spectre",
        build = false,
        cmd = "Spectre",
        opts = { open_cmd = "noswapfile vnew" },
        keys = {
            { "<leader>sr", function() require("spectre").open() end, desc = "Replace in files (Spectre)" },
        },
    }
}
