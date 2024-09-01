local dap = require("dap")
dap.defaults.fallback.external_terminal = {
  command = "$TERM";
  args = {"-e"};
}
dap.defaults.fallback.force_external_terminal = true

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.rust = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
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

-- SET BREAKPOINT ICON --
vim.fn.sign_define('DapBreakpoint', { text = '⦿', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '⧁', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapLogPoint', { text = 'L', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapStopped', { text = '➜', texthl = 'red', linehl = '', numhl = '' })
vim.fn.sign_define('DapBreakpointRejected', { text = '⦾', texthl = 'red', linehl = '', numhl = '' })

