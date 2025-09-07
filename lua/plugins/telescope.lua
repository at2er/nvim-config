local M = {
  'nvim-telescope/telescope.nvim',
  cmd = 'Telescope',
  keys = require('custom.keymaps').plugin.telescope,
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
