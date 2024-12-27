local M = {
  'nvim-telescope/telescope.nvim',
  cmd = "Telescope",
  dependencies = {
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
        find_files = {
          theme = "ivy",
        },
        live_grep = {
          theme = "ivy",
        },
      },
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = actions.close
          }
        }
      }
    })
    telescope.load_extension('fzf')
  end,
}

return M
