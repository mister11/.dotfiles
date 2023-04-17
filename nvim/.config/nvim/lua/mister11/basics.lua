NnoremapGlobal('<leader>u', '<cmd>UndotreeShow<cr>')

-- buffers, local and quickfix list skips
NnoremapGlobal('gn', '<cmd>bnext<cr>')
NnoremapGlobal('gp', '<cmd>bprev<cr>')
NnoremapGlobal("<C-j>", ":cnext<CR>zz")
NnoremapGlobal("<C-k>", ":cprev<CR>zz")
NnoremapGlobal("<leader>k", ":lnext<CR>zz")
NnoremapGlobal("<leader>j", ":lprev<CR>zz")

-- find and center
NnoremapGlobal("n", "nzzzv")
NnoremapGlobal("N", "Nzzzv")


-- moving lines
NnoremapGlobal("<A-j>", ":m .+1<CR>==")
NnoremapGlobal("<A-k>", ":m .-2<CR>==")
InoremapGlobal("<A-j>", "<Esc>:m .+1<CR>==gi")
InoremapGlobal("<A-k>", "<Esc>:m .-2<CR>==gi")
VnoremapGlobal("<A-j>", ":m '>+1<CR>gv=gv")
VnoremapGlobal("<A-k>", ":m '<-2<CR>gv=gv")

NnoremapGlobal("<C-f>", "<cmd>:silent !tmux neww tmux-sessionizer<cr>", { silent = true })

NnoremapGlobal("<C-d>", "<C-d>zz")
NnoremapGlobal("<C-u>", "<C-u>zz")
XnoremapGlobal("<leader>p", "\"_dP")

NnoremapGlobal("<leader>a", "ggVG")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

local filetype_group = augroup("FileTypes", {})
autocmd({"BufNewFile", "BufRead"}, {
    group = filetype_group,
    pattern = "*.js.template",
    callback = function ()
        vim.bo.filetype = "javascript"
    end,
})
