return {
  'stevearc/conform.nvim',
  cmd = { 'ConformInfo' },
  keys = {
    {'<leader>F', function () require('conform').format({ async = true }) end},
  },
  opts = {
    formatters_by_ft = {
      c = { 'clang_format' },
      lua = { 'stylua' },
      javascript = { 'prettierd' },
    },
  }
}
