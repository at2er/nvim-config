local M = {
    {
        "neovim/nvim-lspconfig",
        event = { "InsertEnter", "CmdlineEnter" },
        config = function ()
            local lspconfig = require("lspconfig")
            lspconfig.clangd.setup {}
            lspconfig.omnisharp.setup {}
            lspconfig.lua_ls.setup {}
            lspconfig.tsserver.setup {}
        end,
    }
}

return M
