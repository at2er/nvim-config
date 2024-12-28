local M = {}

M.gdb = {
  type = 'executable',
  command = 'gdb',
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}

return M
