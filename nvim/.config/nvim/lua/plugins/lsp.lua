-- this is weird
-- I want built-in configs, although I have to use after/lsp because of it
-- I also want Mason to install LSPs
-- but I cannot run setup() for nvim-lspconfig since this is deprecated
return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        { "j-hui/fidget.nvim", opts = {} },
    },
    config = function()
        require('mason').setup()
    end
}
