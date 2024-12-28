local M = {}
local adapters = require('custom.dap.adapter')
local config = {}
local vim = vim

config.c = {
  {
    type = "gdb",
    request = "launch",
    name = "Launch and stop at main",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = true,
  },
  {
    type = "gdb",
    request = "launch",
    name = "Launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
    stopAtBeginningOfMainSubprogram = false,
  }
}

config.cpp = config.c

function M.init(dap, dapui)
  dap.configurations = config
  dap.adapters = adapters
end

return M
