local M = {
    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
        opts = {
            indent = {
                char = '▏',
                tab_char = '╎' 
            },
            scope = { show_start = false, show_end = false },
        }
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function ()
            require('nvim-treesitter.configs').setup {
                ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "markdown", "markdown_inline" },
                highlight = {
                    enable = true,
                }
            }
        end
    }
}

return M
