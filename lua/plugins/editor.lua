return {
    {
        "nvim-neo-tree/neo-tree.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
            "MunifTanjim/nui.nvim",
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
        },
        cmd = "Neotree",
        opts = {},
        config = function (_, opts)
            local neotree = require("neo-tree")
            local keymaps = require("custom.keymaps").plugin.neotree()
            local keymap_utils = require("core.keymaps")
            neotree.setup(opts)
            keymap_utils.keymaps_set_all(keymaps)
        end
    },
    {
        "lewis6991/gitsigns.nvim",
        event = { "User MyVeryLazy" },
        opts = {},
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = { "User MyVeryLazy" },
        opts = {}
    }
}
