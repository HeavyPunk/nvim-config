return {
  {
    "mfussenegger/nvim-dap",
    config = function()
      require("config.dap")
    end
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function ()
      require("dapui").setup()
    end
  }
}
