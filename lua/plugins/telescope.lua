local function hl()
  --vim.api.nvim_set_hl(0, 'TelescopeTitle', {
  --  bg = '#4444aa',
  --  fg = '#000000'
  --})
  --vim.api.nvim_set_hl(0, 'TelescopeSelection', {
  --  bg = '#4444aa',
  --  fg = '#000000'
  --})
end

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
        borderchars = { ' ', ' ' ,' ' ,' ' ,' ' ,' ' ,' ' ,' ' },
        mappings = {
          i = {
            ["<esc>"] = actions.close
          }
        }
      }
    })
    telescope.load_extension('fzf')
    hl()
  end,
}

return M
