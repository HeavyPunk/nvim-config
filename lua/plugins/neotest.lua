return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters --
    "fredrikaverpil/neotest-golang",
    "rouge8/neotest-rust"
  },
  config = function ()
    require("neotest").setup({
      adapters = {
        require("neotest-golang") {
          dap_mode = "manual",
          dap_manual_config = {
            name = "Debug go tests",
            type = "go",
            request = "launch",
            mode = "test",
          }
        },
        require("neotest-rust") {
          args = {"--no-capture"},
          dap_adapter = "codelldb"
        },
      }
    })
  end,
}
