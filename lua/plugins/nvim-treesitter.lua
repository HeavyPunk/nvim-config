return {
  "nvim-treesitter/nvim-treesitter",
  version = "*",
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "rust" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true }
    })
  end,
}
