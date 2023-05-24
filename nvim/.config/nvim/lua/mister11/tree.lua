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

-- open tree for dirs only
local function open_nvim_tree(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
        return
    end

    -- change to the directory
    vim.cmd.cd(data.file)

    -- open the tree
    require("nvim-tree.api").tree.open()
end

vim.api.nvim_create_autocmd("VimEnter", { callback = open_nvim_tree })

-- open newly created file
local api = require("nvim-tree.api")
api.events.subscribe(api.events.Event.FileCreated, function(file)
  vim.cmd("edit " .. file.fname)
end)
