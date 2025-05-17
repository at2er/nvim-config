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
    --{
    --    'nvim-treesitter/nvim-treesitter',
    --    event = 'VeryLazy',
    --    opts = {
    --        highlight = { enable = true },
    --        indent = { enable = true },
    --        ensure_installed = {
    --            'c',
    --            'lua',
    --            'vim',
    --            'vimdoc',
    --            'query',
    --            'markdown',
    --            'markdown_inline'
    --        },
    --    },
    --    config = function (_, opts)
    --        require('nvim-treesitter.configs').setup(opts)
    --    end
    --},
}

return M
