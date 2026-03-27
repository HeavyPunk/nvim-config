-- override default notify to custom
vim.notify = require("notify")

-- COLOR SCHEME --
vim.cmd("colorscheme catppuccin-nvim")

-- AUTOSTART --
vim.api.nvim_create_autocmd({"VimEnter"}, {callback = function() require("nvim-tree.api").tree.open() end })
