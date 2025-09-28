local dap = require("dap")
dap.defaults.fallback.external_terminal = {
  command = "alacritty",
  args = {"-e"}
}
dap.defaults.fallback.force_external_terminal = true

dap.adapters.sh = {
  type = "executable",
  command = "bash-debug-adapter"
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = {"--interpreter=dap", "--eval-command", "set print pretty on"}
}

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = "codelldb",
    args = {"--port", "${port}"},
  },
}

dap.adapters.coreclr = {
  type = "executable",
  command = "netcoredbg",
  args = {"--interpreter=vscode"}
}

dap.adapters.go = {
  type = "server",
  port = "${port}",
  executable = {
    command = "dlv",
    args = {"dap", "-l", "127.0.0.1:${port}", "--log", '--log-output="dap"'}
  }
}

dap.configurations.sh = {
  {
    name = "Launch",
    type = "sh",
    request = "launch",
    program = "${file}",
    cwd = "${fileDirname}",
    pathBash = "bash",
    pathCat = "cat",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    env = {},
    args = {}
  }
}

dap.configurations.rust = {
  {
    name = "Launch",
    -- type = "gdb",
    type = "codelldb",
    request = "launch",
    program = function ()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false
  },
  {
    name = "Attach",
    -- type = "gdb",
    type = "codelldb",
    request = "attach",
    pid = function()
      return require("dap.utils").pick_process()
    end,
    program = function ()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}"
  },
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
    name = "Debug via delve",
    type = "go",
    request = "launch",
    program = function()
      return vim.fn.input("Path to main.go: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
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
  },
  {
    type = "coreclr",
    name = "Attach - netcoredbg",
    request = "attach",
    mode = "local",
    processId = require("dap.utils").pick_process
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
