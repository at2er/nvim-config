local M = {
    --'morhetz/gruvbox',
    --lazy = false,
    --priority = 1000,
    --config = function ()
    --    vim.cmd([[colorscheme gruvbox]])
    --end
    {
        "ellisonleao/gruvbox.nvim",
        --lazy = true,
        config = function ()
            vim.cmd[[colorscheme gruvbox]]
        end
    }
}

return M
