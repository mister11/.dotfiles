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

-- auto-open only for directories
local function open_nvim_tree(data)
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    vim.cmd.cd(data.file)
    require("nvim-tree.api").tree.open()
end
vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })

-- automatically open file after create
local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
    vim.cmd("edit " .. file.fname)
end)
