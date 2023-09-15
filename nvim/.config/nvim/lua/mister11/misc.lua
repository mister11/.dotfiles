require('lualine').setup({
    options = {
        theme = 'gruvbox',
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
require('nvim-ts-autotag').setup()
