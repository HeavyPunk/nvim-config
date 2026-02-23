-- OPTIONS --
-- LINE NUMBERING --
vim.wo.number = true

vim.o.laststatus = 3
vim.o.showmode = false

vim.o.clipboard = "unnamedplus"
vim.o.cursorline = true
vim.o.cursorlineopt = "number"

vim.o.expandtab = true
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.softtabstop = 2

vim.opt.fillchars = { eob = " " }
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.mouse = "a"

-- Numbers
vim.o.number = true
vim.o.numberwidth = 2
vim.o.ruler = false

-- disable nvim intro
vim.opt.shortmess:append "sI"

vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.timeoutlen = 400
vim.o.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
vim.o.updatetime = 250

-- enable autoscroll --
vim.o.scrolloff = 10

-- floating window setup --
vim.o.winborder = "rounded"

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"

-- g.mapleader = " "

-- disable some default providers
vim.g.loaded_node_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0


vim.opt.termguicolors = true

-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH

