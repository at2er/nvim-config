local M = {
  {
    "neovim/nvim-lspconfig",
    event = {
      "InsertEnter",
      "CmdlineEnter",
      "BufReadPost",
    },
    config = function ()
      local lspconfig = require("lspconfig")
      local custom_config = require("custom.lsp")

      for _, lsp in ipairs(custom_config.servers) do
        lspconfig[lsp].setup {}
      end

      for type, icon in pairs(custom_config.signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function (args)
          custom_config.init()
          local keymaps = require("custom.keymaps").plugin.lsp()
          local keymap_utils = require("core.keymaps")
          keymap_utils.keymaps_set_all(keymaps)
        end
      })
    end,
  },
}

return M
