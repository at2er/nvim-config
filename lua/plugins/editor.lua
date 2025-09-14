return {
  {
    'nvim-mini/mini.files',
    keys = {
      ---@diagnostic disable-next-line: undefined-global
      { '<leader>e', function () MiniFiles.open() end }
    },
    opts = {},
  },
  {
    'nvim-mini/mini.pairs',
    event = { 'InsertEnter', },
    opts = {},
  },
  {
    'nvim-mini/mini.diff',
    enabled = false,
    event = { 'VeryLazy' },
    opts = {
      view = {
        style = 'sign',
        signs = { add = '│', change = '│', delete = '│' }
      }
    },
  },
  {
    'machakann/vim-swap',
    keys = { 'g<', 'g>', 'gs', },
  },
}
