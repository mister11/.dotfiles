return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
        "debugloop/telescope-undo.nvim",
        "nvim-telescope/telescope-frecency.nvim",
    },
    config = function()
        require('telescope').setup {
            pickers = {
                find_files = {
                    hidden = true
                }
            },
            extensions = {
                undo = {
                    side_by_side = true,
                    layout_strategy = "vertical",
                    layout_config = {
                        preview_height = 0.7,
                    },
                },
                frecency = {
                    default_workspace = "CWD",
                    show_scores = true
                }
            },
        }

        require('telescope').load_extension('fzf')
        require('telescope').load_extension('undo')
        require('telescope').load_extension('frecency')

        function ProjectFiles()
            local in_git_repo = vim.fn.systemlist "git rev-parse --is-inside-work-tree"[1] == 'true'
            if in_git_repo then
                require("telescope.builtin").git_files({ show_untracked = true })
            else
                require("telescope.builtin").find_files()
            end
        end

        NnoremapGlobal('<leader>ff', '<cmd>lua ProjectFiles()<cr>')
        NnoremapGlobal('<leader>fg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')
        NnoremapGlobal('<leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
        NnoremapGlobal('<leader>fw', '<cmd>lua require("telescope.builtin").grep_string()<cr>')
        NnoremapGlobal('<leader>fr', '<cmd>lua require("telescope.builtin").resume()<cr>')
        NnoremapGlobal('<leader>r', '<cmd>Telescope frecency<cr>')
        NnoremapGlobal('<leader>u', '<cmd>Telescope undo<cr>')
    end
}
