local map = vim.keymap.set

-- DAP --
map("n", "<F5>", function()
	require("dapui").open()
	require("dap").continue()
	require("nvim-tree.api").tree.close()
end, { desc = "DAP: Select config" })
map("n", "<F17>", function()
	require("dap").terminate({}, {terminateDebuggee = true}, function()
		require("dapui").close()
		require("nvim-tree.api").tree.toggle({focus = false})
	end)
end, { desc = "DAP: Stop session" })

-- LSP --
map("n", "gd", vim.lsp.buf.definition, {desc = "LSP: Go to definition"})
map("n", "gD", vim.lsp.buf.declaration, {desc = "LSP: Go to declaration"})
map("n", "gi", vim.lsp.buf.implementation, {desc = "LSP: Go to implementation"})
map("n", "gr", require("telescope.builtin").lsp_references, {desc = "LSP: Show references"})
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "LSP: Code actions"})

-- NEOTREE --
map("n", "<leader>e", function()
	require("nvim-tree.api").tree.open()
end)

-- EDITOR --
map('n', '<Leader>sv', function()
  vim.cmd("vsplit")
end, { desc = "Vertical window split" })
map('n', '<Leader>sh', function ()
  vim.cmd("split")
end, { desc = "Horizontal window split" })

-- TERMINAL --
vim.api.nvim_set_keymap("t", "<C-ESC>", "<C-\\><C-n>", { noremap = true })


