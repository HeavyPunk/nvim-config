return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters --
    {"fredrikaverpil/neotest-golang", version = "*"}
  },
  config = function ()
    require("neotest").setup({
      adapters = {
         require("neotest-golang"),
      }
    })
  end,
}
