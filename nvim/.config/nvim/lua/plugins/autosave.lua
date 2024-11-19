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
            end,
        })
    end
}
