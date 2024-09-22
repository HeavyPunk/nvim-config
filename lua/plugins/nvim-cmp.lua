return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"neovim/nvim-lspconfig",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline"
	},
	config = function()
		require("cmp").setup({
			snippet = {
				expand = function(args)
					vim.snippet.expand(args.body)
				end
			},
			window = {
				completion = require("cmp").config.window.bordered(),
				documentation = require("cmp").config.window.bordered()
			},
			sources = require("cmp").config.sources({
				{name = "nvim_lsp"},
				{name = "buffer"}
			}),

			mapping = {
				["<Tab>"] = require("cmp").mapping(function(fallback)
					local cmp = require("cmp")
					if cmp.visible() then
					  cmp.select_next_item()
					elseif vim.snippet.active({direction = 1}) then
					  vim.schedule(function()
						vim.snippet.jump(1)
					  end)
					else
					  fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = require("cmp").mapping(function(fallback)
					local cmp = require("cmp")
					if cmp.visible() then
					  cmp.select_prev_item()
					elseif vim.snippet.active({direction = 1}) then
					  vim.schedule(function()
					    vim.snippet.jump(-1)
					  end)
					else
					  fallback()
					end
				end),
				["<CR>"] = require("cmp").mapping.confirm {
					behavior = require("cmp").ConfirmBehavior.Insert,
					select = true,
				},
				["<C-Space>"] = require("cmp").mapping.complete()
			}
		})
	end,
	lazy = false
}
