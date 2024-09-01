require "nvchad.options"

-- add yours here!

local o = vim.o
o.cursorlineopt ='both' -- to enable cursorline!
o.nu = true

o.scrolloff = 10 -- to keep cursor at center of buffer

-- AUTOSTART --
vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = function() require("nvim-tree.api").tree.open() end })

