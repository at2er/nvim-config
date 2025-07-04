return {
  {
    "echasnovski/mini.files",
    keys = require('custom.keymaps').plugin.mini_files,
    opts = {},
  },
  {
    'echasnovski/mini.pairs',
    event = { "InsertEnter", },
    opts = {},
  },
  {
    'echasnovski/mini.pick',
    keys = require('custom.keymaps').plugin.mini_pick,
    opts = {},
    config = function (opts)
      require('mini.pick').setup(opts)
      ---@diagnostic disable-next-line: undefined-global
      vim.ui.select = MiniPick.ui_select
    end,
  },
  {
    "lewis6991/gitsigns.nvim",
    event = { "VeryLazy" },
    opts = {},
  },
  {
    'machakann/vim-swap',
    keys = require('custom.keymaps').plugin.vim_swap,
  },
}
