require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
o.nu = true

-- AUTOSTART --
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function() require("nvim-tree.api").tree.open() end })

