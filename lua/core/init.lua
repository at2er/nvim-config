local M = {}
local utils = require('core.utils')
local keymaps_utils = require('core.keymaps')
local custom_options = {}

local function apply_custom_opt(table, opt)
  for k, v in pairs(table) do
    opt[k] = v
  end
end

M.apply_custom_options = function ()
  custom_options = require 'custom.options'

  apply_custom_opt(custom_options.options, vim.opt)
  apply_custom_opt(custom_options.globals, vim.g)

  return true
end

M.apply_custom_keymaps = function ()
  local keymaps = require 'custom.keymaps'
  keymaps_utils.keymaps_set_all(keymaps.mappings)
  return true
end

M.init = function ()
  if not M.apply_custom_options() then
    utils.echo_wait({
      { 'Cannot read custom options\n' },
    }, true, {})
  end
  if not M.apply_custom_keymaps() then
    utils.echo_wait({
      { 'Cannot apply custom keymaps\n' },
    }, true, {})
  end

  require('custom.fold').setup()
  require('core.lazy')

  if custom_options.config.colorscheme then
    vim.cmd('colorscheme ' .. custom_options.config.colorscheme)
  end

  if vim.g.neovide then
    vim.g.neovide_normal_opacity = 0.85
  end
end

return M
