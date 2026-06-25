return {
    cmd = { 'dexter', 'lsp' },
    root_markers = { '.dexter/dexter.db', '.dexter.db', '.git', 'mix.exs' },
    filetypes = { 'elixir', 'eelixir', 'heex' },
    init_options = {
        followDelegates = true, -- jump through defdelegate to the target function
        stdlibPath = "/home/mister11/.asdf/installs/elixir/ref-v1.19.0/lib",      -- override Elixir stdlib path (auto-detected)
        -- debug = false,        -- verbose logging to stderr (view with :LspLog)
    },
}
