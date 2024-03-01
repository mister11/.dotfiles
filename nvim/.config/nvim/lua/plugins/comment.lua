return {
        'numToStr/Comment.nvim',
        keys = {
            { '<c-/>',  '<cmd>lua require("Comment.api").toggle.linewise.current()<cr>',                  mode = "n" },
            { '<c-_>',  '<cmd>lua require("Comment.api").toggle.linewise.current()<cr>',                  mode = "n" },
            { '<c-\\>', '<cmd>lua require("comment.api").toggle.blockwise.current()<cr>',                 mode = "n" },

            { '<c-/>',  '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>',  mode = "x" },
            { '<c-_>',  '<esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>',  mode = "x" },
            { '<c-\\>', '<esc><cmd>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<cr>', mode = "n" },
        },
        lazy = false
}
