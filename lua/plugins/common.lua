vim.wo.number = true

-- AUTOSTART --
vim.api.nvim_create_autocmd({"VimEnter"}, {callback = function() require("nvim-tree.api").tree.open() end })

-- COLOR SCHEME --
-- vim.cmd("colorscheme cyberdream")
return {}
