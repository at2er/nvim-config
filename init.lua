local config = require('custom.config')
require('custom.options')
require('custom.keymaps')

require('custom.lsp').setup()
require('custom.fold').setup()
require('core.lazy')

if config.colorscheme then
  vim.cmd('colorscheme ' .. config.colorscheme)
end

if vim.g.neovide then
  vim.g.neovide_normal_opacity = 0.85
end
