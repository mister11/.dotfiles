return {
    {
        "jiaoshijie/undotree",
        keys = {
            { "<leader>u", "<cmd>lua require('undotree').toggle()<cr>" },
        }
    },
    {
        "sindrets/diffview.nvim"
    },
    {
        'nvim-mini/mini.pairs',
        version = '*',
        config = true
    },

    { 'echasnovski/mini.surround', version = '*', config = true },

    {
        "windwp/nvim-ts-autotag",
        opts = {
            aliases = {
                ["heex"] = "html",
                ["elixir"] = "html",
            }
        }
    },
    {
        'MagicDuck/grug-far.nvim',
        config = true,
        keys = {
            { '<leader>sr', '<cmd>GrugFar<cr>' }
        }
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
        opts = {},
    }
}
