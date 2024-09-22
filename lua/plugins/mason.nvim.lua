return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig"
	},
	opts = {
		ui = {
			icons = {
				package_installed = "✔",
				package_pending = "♺",
				package_uninstalled = "✘",
			},
		},
		ensure_installed = {
			"rust-analyzer",
			"lua-language-server",
			"csharp-language-server"
		},
	},
	lazy = false,
}
