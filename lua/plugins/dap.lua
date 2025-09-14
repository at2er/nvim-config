local M = {
  {
    'rcarriga/nvim-dap-ui',
    cmd = {
      'DapToggleBreakpoint',
      'DapContinue',
      'DapStepOut',
      'DapStepOver',
      'DapStepInto',
      'DapToggleRepl',
    },
    keys = {
      { '<leader>db', '<cmd>DapToggleBreakpoint<cr>' },
      { '<leader>dB', function()
        require('dap').set_breakpoint(
          vim.fn.input('Condition for break point: '))
      end },
      { '<leader>dc', '<cmd>DapContinue<cr>' },
      { '<leader>dC', function() require('dap').run_to_cursor() end },
      { '<leader>de', function()
        require('dapui').eval(vim.fn.input('Expression: '))
      end },
      { '<leader>do', '<cmd>DapStepOut<cr>' },
      { '<leader>dO', '<cmd>DapStepOver<cr>' },
      { '<leader>di', '<cmd>DapStepInto<cr>' },
      { '<leader>dr', '<cmd>DapToggleRepl<cr>' },
      { '<leader>dR', function() require('dap').restart() end },
      { '<leader>dx', function() require('dap').close() end },
      { '<F5>', '<cmd>DapContinue<cr>' },
    },
    dependencies = {
      'mfussenegger/nvim-dap',
      'nvim-neotest/nvim-nio',
      'theHamsta/nvim-dap-virtual-text',
    },
    config = function ()
      local conf = require('custom.dap.config')
      local dap, dapui = require('dap'), require('dapui')
      require('nvim-dap-virtual-text').setup()
      dap.listeners.before.attach.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.launch.dapui_config = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
      end
      dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
      end
      dapui.setup()
      conf.setup(dap, dapui)
    end
  },
}

return M
