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

