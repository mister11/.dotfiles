require('lualine').setup({
    options = {
        theme = 'gruvbox-baby',
    },
    sections = {
        lualine_c = {
            {
                "filename",
                path = 3
            }
        }
    }
})
require('gitsigns').setup()
require('nvim-autopairs').setup()
