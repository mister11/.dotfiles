require('telescope').setup {
    pickers = {
        find_files = {
            hidden = true
        }
    },
    defaults = {
        mappings = {
            i = {
                ['<c-u>'] = false,
                ['<c-d>'] = false,
            },
        },
    },
}
require('telescope').load_extension('fzf')

function ProjectFiles()
    local in_git_repo = vim.fn.systemlist "git rev-parse --is-inside-work-tree"[1] == 'true'
    if in_git_repo then
        require("telescope.builtin").git_files({show_untracked = true})
    else
        require("telescope.builtin").find_files()
    end
end

NnoremapGlobal('<leader>ff', '<cmd>lua ProjectFiles()<cr>')
NnoremapGlobal('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
NnoremapGlobal('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')

NnoremapGlobal('<leader>trf', '<cmd>lua require("telescope.builtin").lsp_references()<cr>')
NnoremapGlobal('<leader>ts', '<cmd>lua require("telescope.builtin").lsp_document_symbols()<cr>')
NnoremapGlobal('<leader>tS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols()<cr>')
NnoremapGlobal('<leader>te', '<cmd>lua require("telescope.builtin").diagnostics()<cr>')
NnoremapGlobal('<leader>ti', '<cmd>lua require("telescope.builtin").lsp_implementations()<cr>')
NnoremapGlobal('<leader>td', '<cmd>lua require("telescope.builtin").lsp_definitions()<cr>')
NnoremapGlobal('<leader>ttd', '<cmd>lua require("telescope.builtin").lsp_type_definitions()<cr>')
