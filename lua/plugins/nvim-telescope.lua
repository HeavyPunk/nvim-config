local M = {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-ui-select.nvim",
    },
    config = function ()
      local tel = require("telescope")
      tel.load_extension("ui-select")
    end
  },

  {
    "nvim-telescope/telescope-ui-select.nvim",
  }
}
return M
