local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    -- copilot
    { "github/copilot.vim" },

    -- themes
    { "ellisonleao/gruvbox.nvim", priority = 1000 },

    -- git
    { "sindrets/diffview.nvim",   dependencies = "nvim-lua/plenary.nvim" },
    "nvim-lua/plenary.nvim",
    "lewis6991/gitsigns.nvim",

    -- project explorer
    {
        'nvim-tree/nvim-tree.lua',
        dependencies = {
            'nvim-tree/nvim-web-devicons', -- optional, for file icons
        },
        tag = 'nightly'                    -- optional, updated every week. (see issue #1193)
    },

    -- telescope
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { { "nvim-lua/plenary.nvim" } }
    },
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build =
        "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build"
    },

    -- languages
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate"
    },
    "nvim-treesitter/nvim-treesitter-textobjects",

    -- lsp, snippets, completion
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",

    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/nvim-cmp",

    "l3mon4d3/luasnip",
    "saadparwaiz1/cmp_luasnip",

    "onsails/lspkind-nvim",
    "ray-x/lsp_signature.nvim",

    -- rust
    'neovim/nvim-lspconfig',
    'simrat39/rust-tools.nvim',

    -- misc
    "florinpatrascu/vscode-elixir-snippets",
    "numtostr/Comment.nvim",
    {
        "nvim-lualine/lualine.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons", opt = true }
    },
    "windwp/nvim-autopairs",
    "windwp/nvim-ts-autotag",
    "mbbill/undotree",
    "Pocco81/auto-save.nvim",
    "ThePrimeagen/harpoon",
    {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
    },
    { "sbdchd/neoformat" },
})
