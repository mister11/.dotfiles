local autosave = require("auto-save")

autosave.setup(
    {
        execution_message = {
            message = "Autosaved!"
        },
        trigger_events = { "InsertLeave", "TextChanged" },
        write_all_buffers = false,
        debounce_delay = 135
    }
)
