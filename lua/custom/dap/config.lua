local M = {}
local adapters = require('custom.dap.adapter')
local config = {}
local vim = vim

config.c = {
  {
    type = 'gdb',
    request = 'launch',
    name = 'Launch and stop at main',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function ()
      return vim.fn.split(vim.fn.input('Args: '), ' ')
    end,
    cwd = '${workspaceFolder}',
    stopAtBeginningOfMainSubprogram = true,
    console = 'integratedTerminal',
  },
  {
    type = 'gdb',
    request = 'launch',
    name = 'Launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    args = function ()
      return vim.fn.split(vim.fn.input('Args: '), ' ')
    end,
    cwd = '${workspaceFolder}',
    stopAtBeginningOfMainSubprogram = false,
    console = 'integratedTerminal',
  }
}

config.cpp = config.c

function M.setup(dap, dapui)
  vim.fn.sign_define('DapBreakpoint', {
    text = '',
    texthl = 'DapBreakpoint',
    linehl = '',
    numhl = 'DapBreakpoint'
  })

  vim.fn.sign_define('DapBreakpointCondition', {
    text = '',
    texthl = 'DapBreakpointCondition',
    linehl = 'DapBreakpointCondition',
    numhl = 'DapBreakpointCondition'
  })

  vim.fn.sign_define('DapStopped', {
    text = '',
    texthl = 'DapStopped',
    linehl = 'DapStopped',
    numhl = 'DapStopped'
  })

  dap.configurations = config
  dap.adapters = adapters
end

return M
