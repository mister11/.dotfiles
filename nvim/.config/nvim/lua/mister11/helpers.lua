function CreateNoremapGlobal(type, outer_opts)
    return function(mapping, action, opts)
        opts = vim.tbl_deep_extend("force", outer_opts, opts or {})
        vim.keymap.set(type, mapping, action, opts)
    end
end

function CreateNoremapBuffer(type, outer_opts)
    return function(mapping, action, opts, bufferNumber)
        opts = opts or {}
        opts.buffer = bufferNumber or 0
        opts = vim.tbl_deep_extend("force", outer_opts, opts)
        vim.keymap.set(type, mapping, action, opts)
    end
end

NnoremapGlobal = CreateNoremapGlobal("n", { noremap = true })
InoremapGlobal = CreateNoremapGlobal("i", { noremap = true })
VnoremapGlobal = CreateNoremapGlobal("v", { noremap = true })
XnoremapGlobal = CreateNoremapGlobal("x", { noremap = true })
Nnoremap = CreateNoremapBuffer("n", { noremap = true })
Inoremap = CreateNoremapBuffer("i", { noremap = true })
