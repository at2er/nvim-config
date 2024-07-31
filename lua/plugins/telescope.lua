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
            defaults = {
                mappings = {
                    i = {
                        ["<esc>"] = require('telescope.actions').close
                    }
                }
            }
        })
        telescope.load_extension('fzf')
    end,
}

return M
