require('Comment').setup()

-- C-/ works for non-tmux sessions
-- C-_ works for tmux sessions (C-/ is not valid in tmux)
vim.keymap.set('n', '<C-/>', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>')
vim.keymap.set('n', '<C-_>', '<CMD>lua require("Comment.api").toggle.linewise.current()<CR>')
vim.keymap.set('n', '<C-\\>', '<CMD>lua require("Comment.api").toggle.blockwise.current()<CR>')

vim.keymap.set('x', '<C-/>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
vim.keymap.set('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')
vim.keymap.set('x', '<C-\\>', '<ESC><CMD>lua require("Comment.api").toggle.blockwise(vim.fn.visualmode())<CR>')
