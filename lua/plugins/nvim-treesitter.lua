return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter")
    local install_dir = vim.fn.stdpath('data') .. '/site'
    configs.setup({
      install_dir = install_dir,
      -- ensure_installed = {
      --   "c", "lua", "vim",
      --   "vimdoc", "javascript", "html",
      --   "rust", "c_sharp", "yaml",
      --   "css", "go", "http", "bash",
      --   "kotlin", "http"
      -- },
    })
    vim.opt.rtp:prepend(install_dir)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function()
        pcall(function() vim.treesitter.start() end)
      end,
    })
  end,
}
