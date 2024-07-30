local M = {}

M.setup = function ()
    local cmp = require('cmp')
    local maps = require('custom.keymaps').plugin.cmp(cmp)
    cmp.setup({
        sources = cmp.config.sources ({
            { name = 'nvim_lsp' },
            { name = 'buffer' },
            { name = 'nvim_lsp_signature_help' },
        }),
        mapping = maps
    })
end

M.config = {
    'hrsh7th/nvim-cmp',
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp-signature-help',
    },
    config = M.setup,
}

return M.config
