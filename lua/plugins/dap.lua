local M = {
  {
    "rcarriga/nvim-dap-ui",
    cmd = {
      "DapToggleBreakpoint",
      "DapContinue",
      "DapStepOut",
      "DapStepOver",
      "DapStepInto",
      "DapToggleRepl",
    },
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio"
    },
    config = function ()
      local conf = require('custom.dap.config')
      local dap = require('dap')
      local dapui = require('dapui')
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function ()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function ()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function ()
        dapui.close()
      end
      conf.init(dap, dapui)
    end
  },
}

return M
