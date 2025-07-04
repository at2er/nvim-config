local M = {
  'saghen/blink.cmp',
  event = {
    "InsertEnter",
    "CmdlineEnter"
  },
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = require('custom.cmp').opts,
}

return M
