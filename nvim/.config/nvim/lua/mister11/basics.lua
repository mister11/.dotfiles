NmapGlobal("n", "nzzzv")
NmapGlobal("N", "Nzzzv")
NmapGlobal("]q", ":cnext<CR>zzzv")
NmapGlobal("[q", ":cprev<CR>zzzv")

-- moving lines
NmapGlobal("<A-j>", ":m .+1<CR>==")
NmapGlobal("<A-k>", ":m .-2<CR>==")
ImapGlobal("<A-j>", "<Esc>:m .+1<CR>==gi")
ImapGlobal("<A-k>", "<Esc>:m .-2<CR>==gi")
VmapGlobal("<A-j>", ":m '>+1<CR>gv=gv")
VmapGlobal("<A-k>", ":m '<-2<CR>gv=gv")

NmapGlobal("<C-f>", "<cmd>:silent !tmux neww tmux-sessionizer<cr>", { silent = true })

NmapGlobal("<C-d>", "<C-d>zz")
NmapGlobal("<C-u>", "<C-u>zz")
XmapGlobal("<leader>p", "\"_dP")

NmapGlobal("<leader>a", "ggVG")

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 100,
        })
    end,
})

local filetype_group = augroup("FileTypes", {})
autocmd({ "BufNewFile", "BufRead" }, {
    group = filetype_group,
    pattern = "*.js.eex",
    callback = function()
        vim.bo.filetype = "javascript"
    end,
})
autocmd({ "BufNewFile", "BufRead" }, {
    group = filetype_group,
    pattern = "*.env",
    callback = function()
        vim.bo.filetype = "jproperties"
    end,
})

vim.api.nvim_create_autocmd({ "FocusGained", }, { command = "checktime" })

-- c/p files between Neovim instances and system
vim.api.nvim_create_autocmd('filetype', {
	pattern = 'NvimTree',
	desc = 'Mappings for NvimTree',
	callback = function()
		-- Yank marked files
		vim.keymap.set('n', 'bgy',
			function()
				local api = require 'nvim-tree.api'
				local marks = api.marks.list()
				if #marks == 0 then
					print('No items marked')
					return
				end
				local absolute_file_paths = ''
				for _, mark in ipairs(marks) do
					absolute_file_paths = absolute_file_paths .. mark.absolute_path .. '\n'
				end
				-- Using system registers for multi-instance support.
				vim.fn.setreg("+", absolute_file_paths)
				print('Yanked ' .. #marks .. ' items')
			end,
			{ remap = true, buffer = true })

		-- Paste files
		vim.keymap.set('n', 'gp',
			function()
				local api = require 'nvim-tree.api'
				local source_paths = {}
				for path in vim.fn.getreg('+'):gmatch('[^\n%s]+') do
					source_paths[#source_paths + 1] = path
				end
				local node = api.tree.get_node_under_cursor()
				local is_folder = node.fs_stat and node.fs_stat.type == 'directory' or false
				local target_path = is_folder and node.absolute_path or
					vim.fn.fnamemodify(node.absolute_path, ":h")
				for _, source_path in ipairs(source_paths) do
					vim.fn.system { 'cp', '-R', source_path, target_path }
				end
				api.tree.reload()
				print('Pasted ' .. #source_paths .. ' items')
			end,
			{ remap = true, buffer = true })
	end
})

