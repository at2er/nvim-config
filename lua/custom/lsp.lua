local severity = vim.diagnostic.severity
local M = {}

M.diagnostic = {
  float_diagnostic = {
    enable = false,
    updatetime = 250
  },
  config = {
    virtual_text = false,
    virtual_lines = true,
    float = {
      source = "always",
    },
    signs = {
      text = {
        [severity.ERROR] = "󰅚 ",
        [severity.WARN] = "󰀪 ",
        [severity.INFO] = " ",
        [severity.HINT] = "󰌶 "
      }
    },
    update_in_insert = true,
  }
}

M.servers = {
  'clangd',
  'lua_ls',
  'pyright',
}

function M.init()
  for _, server in ipairs(M.servers) do
    vim.lsp.enable(server)
  end
  vim.diagnostic.config(M.diagnostic.config)
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function (args)
      local keymaps = require("custom.keymaps").plugin.lsp()
      local keymap_utils = require("core.keymaps")
      local use_native_cmp = require("custom.options").config.native_complete
      keymap_utils.keymaps_set_all(keymaps)
      if use_native_cmp then
        require("core.complete").setup(args.buf)
      end
    end
  })
end

return M
