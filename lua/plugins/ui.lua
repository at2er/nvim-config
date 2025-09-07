local M = {
  {
    'at2er/simple-tabline.nvim',
    event = { 'TabNew', 'TabNewEntered' },
    opts = {
      separator = { ' ', ' ' },
    },
  },
  {
    'simple-statusline.nvim',
    event = 'VeryLazy',
    opts = {},
  },
  {
    'echasnovski/mini.indentscope',
    event = { 'BufEnter' },
    opts = {
      symbol = '│',
    },
  }
}

return M
