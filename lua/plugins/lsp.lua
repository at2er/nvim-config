local M = {
  {
    "neovim/nvim-lspconfig",
    dependencies = { 'saghen/blink.cmp' },
    event = {
      "InsertEnter",
      "CmdlineEnter",
      "BufReadPost",
    },
    config = function ()
      local lspconfig = require("lspconfig")
      local custom_config = require("custom.lsp")
      local blink_cmp = require("blink.cmp")

      for server, config in pairs(custom_config.servers) do
        config.capabilities = blink_cmp.get_lsp_capabilities(config.capabilities)
        lspconfig[server].setup(config)
      end

      vim.diagnostic.config(custom_config.diagnostic.config)

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function (args)
          local keymaps = require("custom.keymaps").plugin.lsp()
          local keymap_utils = require("core.keymaps")
          keymap_utils.keymaps_set_all(keymaps)
        end
      })
    end,
  },
  --{
  --  'saghen/blink.cmp',
  --  dependencies = 'rafamadriz/friendly-snippets',
  --  version = '*',
  --  ---@module 'blink.cmp'
  --  ---@type blink.cmp.Config
  --  opts = {
  --    keymap = require('custom.keymaps').plugin.cmp(),
  --    completion = {
  --      documentation = {
  --        auto_show = true,
  --        auto_show_delay_ms = 0,
  --      },
  --    },
  --    signature = { enabled = true, },
  --    appearance = {
  --      use_nvim_cmp_as_default = true,
  --      nerd_font_variant = 'mono'
  --    },
  --    sources = {
  --      default = { 'lsp', 'path', 'snippets', 'buffer' },
  --    },
  --  },
  --  opts_extend = { "sources.default" }
  --},
}

return M
