local dap = require("dap")
dap.defaults.fallback.external_terminal = {
  command = "$TERM",
  args = {"-e"}
}
dap.defaults.fallback.force_external_terminal = true

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = {"--interpreter=dap", "--eval-command", "set print pretty on"}
}

dap.adapters.coreclr = {
  type = "executable",
  command = "netcoredbg",
  args = {"--interpreter=vscode"}
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function ()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false
  }
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function ()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false
  }
}

dap.configurations.cpp = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function ()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false
  }
}

dap.configurations.go = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false
  }
}

dap.configurations.cs = {
  {
    type = "coreclr",
    name = "Launch - netcoredbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to dll", vim.fn.getcwd() .. "bin/Debug", "file")
    end,
  }
}

-- SET BREAKPOINT ICON --
-- https://github.com/mfussenegger/nvim-dap/discussions/355
vim.api.nvim_set_hl(0, 'DapBreakpoint', { ctermbg = 0, fg = '#993939', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapLogPoint', { ctermbg = 0, fg = '#61afef', bg = '#31353f' })
vim.api.nvim_set_hl(0, 'DapStopped', { ctermbg = 0, fg = '#98c379', bg = '#31353f' })

vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = 'DapBreakpoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '⧁', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = 'L', texthl = 'DapLogPoint', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➜', texthl = 'DapStopped', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '⦾', texthl = 'red', linehl = '', numhl = '' })
