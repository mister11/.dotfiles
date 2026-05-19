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

-- Function to open current file in GitHub browser
local function open_in_github()
    -- Get the current file path relative to git root
    local filepath = vim.fn.expand('%:p')

    -- Check if file exists
    if filepath == '' then
        vim.notify('No file is currently open', vim.log.levels.WARN)
        return
    end

    -- Get git root directory
    local git_root = vim.fn.systemlist('git rev-parse --show-toplevel')[1]
    if vim.v.shell_error ~= 0 then
        vim.notify('Not in a git repository', vim.log.levels.ERROR)
        return
    end

    -- Get relative path from git root
    local relative_path = filepath:sub(#git_root + 2) -- +2 to skip the trailing slash

    -- Get the remote URL for origin
    local remote_url = vim.fn.systemlist('git remote get-url origin')[1]
    if vim.v.shell_error ~= 0 then
        vim.notify('No origin remote found', vim.log.levels.ERROR)
        return
    end

    -- Get default branch
    local default_branch = vim.fn.systemlist('git symbolic-ref refs/remotes/origin/HEAD')[1]
    if vim.v.shell_error ~= 0 then
        -- Fallback: try to get default branch from remote
        default_branch = vim.fn.systemlist('git remote show origin | grep "HEAD branch" | cut -d" " -f5')[1]
        if vim.v.shell_error ~= 0 then
            vim.notify('Could not determine default branch, using "main"', vim.log.levels.WARN)
            default_branch = 'main'
        end
    else
        -- Extract branch name from refs/remotes/origin/HEAD
        default_branch = default_branch:match('refs/remotes/origin/(.+)')
    end

    -- Convert git URL to GitHub web URL
    local github_url = remote_url
        :gsub('git@github%.com:', 'https://github.com/')
        :gsub('%.git$', '')
        :gsub('^https://github%.com/', 'https://github.com/')

    -- Construct the full URL
    local full_url = string.format('%s/blob/%s/%s', github_url, default_branch, relative_path)

    -- Open in browser
    vim.fn.system(string.format('xdg-open "%s"', full_url))
end

-- Create a command
vim.api.nvim_create_user_command('GithubOpen', open_in_github, {})

-- Create a keymap (example: <leader>gh)
vim.keymap.set('n', '<leader>gh', open_in_github, { desc = 'Open file in GitHub' })
