require('nvim-tree').setup {
    git = {
        ignore = false
    },
    view = {
        adaptive_size = true
    }
}

NnoremapGlobal('<leader>pe', '<cmd>NvimTreeFocus<cr>')
NnoremapGlobal('<leader>pt', '<cmd>NvimTreeToggle<cr>')
NnoremapGlobal('<leader>pf', '<cmd>NvimTreeFindFile<cr>')

local function open_nvim_tree()
    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })