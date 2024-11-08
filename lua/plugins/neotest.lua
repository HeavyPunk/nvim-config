return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    -- Adapters --
    {"HeavyPunk/neotest-golang", version = "*" },
    "rouge8/neotest-rust"
  },
  config = function ()
    require("neotest").setup({
      adapters = {
        require("neotest-golang") {
          dap_manual_enabled = true,
          dap_manual_configuration = {
            name = "Debug go tests",
            type = "go",
            request = "launch",
            mode = "test",
          }
        },
        require("neotest-rust") {
          args = {"--no-capture"},
          dap_adapter = "gdb"
        },
      }
    })
  end,
}
