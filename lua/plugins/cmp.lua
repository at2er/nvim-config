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
    mapping = cmp.mapping.preset.insert(maps),
    formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
        local kind = require("custom.lsp").kind_icons
        vim_item.menu = "(" .. vim_item.kind .. ")"
        vim_item.kind = kind[vim_item.kind] or ""
        return vim_item
      end
    }
  })

  --cmp.setup.cmdline('/', {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = {
  --    { name = 'buffer' }
  --  }
  --})

  --cmp.setup.cmdline(':', {
  --  mapping = cmp.mapping.preset.cmdline(),
  --  sources = cmp.config.sources({
  --    { name = 'path' },
  --    { name = 'cmdline', option = { ignore_cmds = { 'Man', '!' } } }
  --  })
  --})
end

M.config = {
  'hrsh7th/nvim-cmp',
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp-signature-help',
    'hrsh7th/cmp-cmdline'
  },
  config = M.setup,
}

return M.config
