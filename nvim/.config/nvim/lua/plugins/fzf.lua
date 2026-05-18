return {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    lazy = false,
    opts = {},
    keys = {
        { "<leader>ff",
            function() 
                local in_git_repo = vim.fn.systemlist "git rev-parse --is-inside-work-tree"[1] == 'true'
                if in_git_repo then
                    require('fzf-lua').git_files()
                else
                    require('fzf-lua').files()
                end
            end
        },
        { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
        { "<leader>fw", "<cmd>FzfLua grep_cword<cr>", desc = "Live Grep" },
        { "<leader>fW", "<cmd>FzfLua grep_cWORD<cr>", desc = "Live Grep" },
        { "<leader>fv", "<cmd>FzfLua grep_visual<cr>", mode = 'x', desc = "Live Grep" },
        { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Live Grep" },
        { "<leader>fh", "<cmd>FzfLua helptags<cr>", desc = "Live Grep" },
    }
}
