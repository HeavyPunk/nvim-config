local map = vim.keymap.set

-- DAP --
map("n", "<F5>", function()
	require("dapui").open()
	require("dap").continue()
	require("nvim-tree.api").tree.close()
end, { desc = "DAP: Select config" })
map("n", "<F17>", function() -- <S-F5> https://github.com/neovim/neovim/issues/7384#issuecomment-504996618
	require("dap").terminate({}, {terminateDebuggee = true}, function()
		require("dapui").close()
		require("nvim-tree.api").tree.toggle({focus = false})
	end)
end, { desc = "DAP: Stop session" })

map('n', '<F10>', function() require("dap").step_over() end, { desc = "DAP: Step over" })
map('n', '<F34>', function() require("dap").reverse_continue() end, { desc = "DAP: Reverse continue" }) -- <C-F10> -- https://github.com/neovim/neovim/issues/7384#issuecomment-504996618
map('n', '<F11>', function() require("dap").step_into() end, { desc = "DAP: Step into" })
map('n', '<F12>', function() require("dap").step_out() end, {desc = "DAP: Step out" })
map('n', '<Leader>b', function() require("dap").toggle_breakpoint() end, { desc = "DAP: Toggle breakpoint" });
map('n', '<Leader>B', function() require("dap").set_breakpoint() end, { desc = "DAP: Set breakpoint" })
map('n', '<Leader>lp', function() require("dap").set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end, { desc = "DAP: Set log point breakpoint" })
map('n', '<Leader>dr', function() require("dap").repl.open() end, { desc = "DAP: REPL open" })
map('n', '<Leader>dl', function() require("dap").run_last() end, { desc = "DAP: Last run" })
map({'n', 'v'}, '<Leader>dh', function()
  require('dap.ui.widgets').hover()
end, { desc = "DAP: Hover widgets" })
map({'n', 'v'}, '<Leader>dp', function()
  require('dap.ui.widgets').preview()
end, { desc = "DAP: Preview widgets" })
map('n', '<Leader>df', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { desc = "DAP: Centered float frames" })

-- LSP --
map("n", "gd", vim.lsp.buf.definition, {desc = "LSP: Go to definition"})
map("n", "gD", vim.lsp.buf.declaration, {desc = "LSP: Go to declaration"})
map("n", "gi", vim.lsp.buf.implementation, {desc = "LSP: Go to implementation"})
map("n", "gr", require("telescope.builtin").lsp_references, {desc = "LSP: Show references"})
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "LSP: Code actions"})

-- NEOTREE --
map("n", "<leader>e", function()
	require("nvim-tree.api").tree.open()
end, { desc = "Neotree: focus window"})

-- EDITOR --
map('n', '<Leader>sv', function()
  vim.cmd.split({mods = {vertical = true}})
end, { desc = "Vertical window split" })
map('n', '<Leader>sh', function ()
  vim.cmd.split()
end, { desc = "Horizontal window split" })

-- TERMINAL --
map("n", "<leader>h", function() vim.cmd("ToggleTerm") end, {desc = "Terminal: Toggle terminal"})
vim.api.nvim_set_keymap("t", "<C-ESC>", "<C-\\><C-n>", { noremap = true })

-- TELESCOPE --
map("n", "<leader>tsl", function ()
  require("telescope.builtin").live_grep({
    cwd = vim.fn.getcwd(),
    prompt_title = "find string in files..."
  })
end, {desc = "Telescope: Live grep"})
map("n", "<leader>tsf", function ()
  require("telescope.builtin").find_files({
    hidden = true,
    cwd = vim.fn.getcwd()
  })
end, {desc = "Telescope: Find file"})

-- GIT --
map("n", "<leader>gl", function ()
  require("gitgraph").draw({}, {all = true, max_count = 5000})
end, {desc = "GitGraph - Draw"})
map("n", "<leader>dvo", function ()
  vim.cmd("DiffviewOpen")
end, {desc = "DiffView: Open"})
map("n", "<leader>dvc", function ()
  vim.cmd("DiffviewClose")
end, {desc = "DiffView: Close"})

-- NEOTEST --
map("n", "<leader>nts", function ()
  require("neotest").summary.toggle()
end, {desc = "NeoTest: Summary toggle"})
map("n", "<leader>ntr", function ()
  require("neotest").run.run()
end, {desc = "NeoTest: Run nearest test"})
map("n", "<leader>ntd", function ()
  require("neotest").run.run({strategy = "dap"})
end, {desc = "NeoTest: Debug nearest test"})
map("n", "<leader>nta", function ()
  require("neotest").run.attach()
end, {desc = "NeoTest: Attach to nearest test"})



