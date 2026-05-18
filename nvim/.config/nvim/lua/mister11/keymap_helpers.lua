local function map(mode, shortcut, action, opts_arg)
    local opts = opts_arg or {}
    local desc = opts.desc or ""
    local buf = opts.buf or 0
    vim.keymap.set(mode, shortcut, action, { buffer = buf, desc = desc, noremap = true })
end

local function mapGlobal(mode, shortcut, action)
    vim.keymap.set(mode, shortcut, action, { noremap = true, silent = true })
end

function Nmap(shortcut, action, opts)
    map('n', shortcut, action, opts)
end

function NmapGlobal(shortcut, action)
    mapGlobal('n', shortcut, action)
end

function Xmap(shortcut, action, opts)
    map('x', shortcut, action, opts)
end

function XmapGlobal(shortcut, action)
    mapGlobal('x', shortcut, action)
end

function Imap(shortcut, action, opts)
    map('i', shortcut, action, opts)
end

function ImapGlobal(shortcut, action)
    mapGlobal('i', shortcut, action)
end

function Vmap(shortcut, action, opts)
    map('v', shortcut, action, opts)
end

function VmapGlobal(shortcut, action)
    mapGlobal('v', shortcut, action)
end

