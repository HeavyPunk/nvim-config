return {
	"scottmckendry/cyberdream.nvim",
	lazy = false,
	priority = 1000,
	opts = {
		transparent = true,
		italic_comments = true,
		borderless_telescope = false,
		terminal_colors = true,
		theme = {
			variant = "default",
			highlights = {
				Comment = { fg = "#696969", bg = "NONE", italic = true },
			}
		}
	}
}
