return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    opts = {
        options = {
            theme = 'gruvbox',
        },
        sections = {
            lualine_b = {
                {
                    "filename",
                    path = 1
                }
            },
            lualine_c = {}
        }
    }
}
