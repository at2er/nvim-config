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
    keys = require('custom.keymaps').plugin.dap,
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
