local M = {}
local api = vim.api
local hi = api.nvim_set_hl
local opts = {}

function M.init()
  hi(0, 'StatusLineModeC', { bg = '#8c4028', fg = '#000000' })
  hi(0, 'StatusLineModeI', { bg = '#0066aa', fg = '#000000' })
  hi(0, 'StatusLineModeN', { bg = '#4444aa', fg = '#000000' })
  hi(0, 'StatusLineModeV', { bg = '#aa00aa', fg = '#000000' })
  hi(0, 'StatusLineModeV', { bg = '#aa00aa', fg = '#000000' })
end

function M.setup()
  M.init()
  return opts
end

return M
