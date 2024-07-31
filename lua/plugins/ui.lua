local M = {
    {
        "lukas-reineke/indent-blankline.nvim",
        event = "User MyVeryLazy",
        main = "ibl",
        opts = {
            indent = {
                char = '▏',
                tab_char = '╎'
            },
            scope = { show_start = false, show_end = false },
            exclude = {
                filetypes = {
                    "dashboard"
                }
            }
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        event = "User MyVeryLazy",
        opts = {
            highlight = { enable = true },
            indent = { enable = true },
            ensure_installed = {
                "c",
                "lua",
                "vim",
                "vimdoc",
                "query",
                "markdown",
                "markdown_inline"
            },
        },
        config = function (_, opts)
            require("nvim-treesitter.configs").setup(opts)
        end
    },
    {
        'nvimdev/dashboard-nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
        config = function()
            local db = require("dashboard")
            ---@diagnostic disable-next-line: different-requires
            local config = require("custom.dashboard")
            config.init()
            db.setup(config.config)
        end,
    },
}

return M
