local actions = require('telescope.actions')
local telescope = {
    defaults = {
        mappings = {
            i = {
                ["<esc>"] = actions.close
            }
        }
    }
}
local config = {}

local M = {
    {
        'nvim-telescope/telescope.nvim',
        cmd = "Telescope",
        dependencies = {
            'nvim-lua/plenary.nvim',
            'BurntSushi/ripgrep'
        },
        config = function ()
            telescope = require('telescope')
            telescope.setup(config)
            telescope.load_extension('fzf')
        end,
    },
    {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make'
    }
}

return M
