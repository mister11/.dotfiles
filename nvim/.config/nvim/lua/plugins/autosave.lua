return {
    "okuuva/auto-save.nvim",
    event = { "InsertLeave", "TextChanged" },
    config = function()
        require("auto-save").setup({
            debounce_delay = 135,
            condition = function(buf)
                if vim.bo[buf].filetype == "harpoon" then
                    return false
                end
                return true
            end
        })

        local group = vim.api.nvim_create_augroup('autosave', {})

        vim.api.nvim_create_autocmd('User', {
            pattern = 'AutoSaveWritePost',
            group = group,
            callback = function(opts)
                if opts.data.saved_buffer ~= nil then
                    print("Autosaved!")
                end
            end,
        })
    end
}
