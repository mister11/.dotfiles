return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    config = function()
        require("copilot").setup({
            panel = {
                enabled = false
            },
            suggestion = {
                auto_trigger = true,
                keymap = {
                    accept = "<C-y>",
                    dismiss = "<C-x>",
                },
            },
            filetypes = {
                ["*"] = true
            }
        })
    end,
}
