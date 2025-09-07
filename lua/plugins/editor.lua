return {
  {
    'echasnovski/mini.files',
    keys = require('custom.keymaps').plugin.mini_files,
    opts = {},
  },
  {
    'echasnovski/mini.pairs',
    event = { 'InsertEnter', },
    opts = {},
  },
  {
    'lewis6991/gitsigns.nvim',
    event = { 'VeryLazy' },
    opts = {},
  },
  {
    'machakann/vim-swap',
    keys = require('custom.keymaps').plugin.vim_swap,
  },
}
