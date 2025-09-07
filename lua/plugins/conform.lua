return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  event = { 'BufWritePre' },
  keys = require('custom.keymaps').plugin.conform,
  opts = {
    formatters_by_ft = {
      c = { 'clang_format' },
      lua = { 'stylua' },
      javascript = { 'prettierd' },
    },
  }
}
