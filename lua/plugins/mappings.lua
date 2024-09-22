local map = vim.keymap.set

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
map("n", "gr", vim.lsp.buf.references, {desc = "LSP: Show references"})
map("n", "<leader>ca", vim.lsp.buf.code_action, {desc = "LSP: Code actions"})

-- NEOTREE --
map("n", "<leader>e", function()
	require("nvim-tree.api").tree.open()
end)

return {}
