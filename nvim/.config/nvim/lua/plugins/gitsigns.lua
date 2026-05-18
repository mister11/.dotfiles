return {
    "lewis6991/gitsigns.nvim",
    event = { "BufReadPre", "BufNewFile" },
    keys = {
        { "<leader>hr", '<cmd>Gitsigns reset_hunk<cr>' },
        { "<leader>hp", '<cmd>Gitsigns preview_hunk<cr>' },
        { "<leader>hR", '<cmd>Gitsigns reset_buffer<cr>' },
        { "<leader>hb", '<cmd>Gitsigns blame_line<cr>' }
    }
}
