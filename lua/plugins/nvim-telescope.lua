local M = {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
      -- "Decodetalkers/csharpls-extended-lsp.nvim"
    },
    config = function ()
      local tel = require("telescope")
      tel.setup({
        pickers = {
          live_grep = {
            additional_args = {"--hidden"}
          }
        },
        defaults = {
          border = false -- TTL: while unmerged https://github.com/nvim-lua/plenary.nvim/pull/649
        },
      })
      tel.load_extension("ui-select")
      -- tel.load_extension("csharpls_definition")
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  }
}
return M
