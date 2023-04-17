local opts = { silent = true }
NnoremapGlobal("<leader>m", function() require("harpoon.mark").add_file() end, silent)
NnoremapGlobal("<C-e>", function() require("harpoon.ui").toggle_quick_menu() end, opts)
NnoremapGlobal("<M-a>", function() require("harpoon.ui").nav_file(1) end, silent)
NnoremapGlobal("<M-s>", function() require("harpoon.ui").nav_file(2) end, silent)
NnoremapGlobal("<M-;>", function() require("harpoon.ui").nav_file(3) end, silent)
NnoremapGlobal("<M-'>", function() require("harpoon.ui").nav_file(4) end, silent)
