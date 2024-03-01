return {
    "pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup({
            execution_message = {
                message = "Autosaved!"
            },
            trigger_events = { "InsertLeave", "TextChanged" },
            write_all_buffers = false,
            debounce_delay = 135
        })
    end
}
