local M = {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  keys = {
    { '<leader>ff', '<cmd>Telescope find_files<cr>'},
    { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
    { '<leader>fb', '<cmd>Telescope buffers<cr>'   },
    { '<leader>fh', '<cmd>Telescope help_tags<cr>' },
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim',
    'BurntSushi/ripgrep',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make'
    }
  },
  config = function ()
    local telescope = require('telescope')
    local actions = require('telescope.actions')
    telescope.setup({
      pickers = {
        lsp_references = { theme = 'dropdown', },
        find_files     = { theme = 'dropdown', },
        live_grep      = { theme = 'dropdown', },
      },
      defaults = {
        borderchars = { ' ', ' ' ,' ' ,' ' ,' ' ,' ' ,' ' ,' ' },
        mappings = {
          i = {
            ['<esc>'] = actions.close
          }
        }
      }
    })
    telescope.load_extension('fzf')
  end,
}

return M
