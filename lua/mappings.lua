require "nvchad.mappings"

local map = vim.keymap.set

-- add yours here

local dap = require("dap")
local dapui = require("dapui")
local neotree = require("nvim-tree.api")
map("n", "<F5>", function()
  dapui.open()
  dap.continue()
  neotree.tree.close()
end, { desc = "DAP: Select configuraion" })
map("n", "<F17>", function() -- <S-F5> https://github.com/neovim/neovim/issues/7384#issuecomment-504996618
  dap.terminate({}, { terminateDebuggee = true }, function()
    dapui.close()
    neotree.tree.toggle({ focus = false })
  end)
end, { desc = "DAP: Stop session"})

map('n', '<F10>', function() dap.step_over() end, { desc = "DAP: Step over" })
map('n', '<F34>', function() dap.reverse_continue() end, { desc = "DAP: Reverse continue" }) -- <C-F10> -- https://github.com/neovim/neovim/issues/7384#issuecomment-504996618
map('n', '<F11>', function() dap.step_into() end, { desc = "DAP: Step into" })
map('n', '<F12>', function() dap.step_out() end, {desc = "DAP: Step out" })
map('n', '<Leader>b', function() dap.toggle_breakpoint() end);
map('n', '<Leader>B', function() dap.set_breakpoint() end)
map('n', '<Leader>lp', function() dap.set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
map('n', '<Leader>dr', function() dap.repl.open() end)
map('n', '<Leader>dl', function() dap.run_last() end)
map({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end)
map({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end)
map('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end)
map('n', '<Leader>ds', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end)

-- TREE --
local nvim_tree_api = require("nvim-tree.api")
map("n", "<C-t>", function() nvim_tree_api.tree.toggle() end)
----------

-- TERMINAL --
vim.api.nvim_set_keymap("t", "<C-ESC>", "<C-\\><C-n>", { noremap = true })
--------------

-- map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

