local severity = vim.diagnostic.severity
local M = {}

M.kind_icons = {
  Text = ' ',
  Method = ' ',
  Function = ' ',
  Constructor = ' ',
  Field = ' ',
  Variable = ' ',
  Class = ' ',
  Interface = ' ',
  Module = ' ',
  Property = ' ',
  Unit = ' ',
  Value = ' ',
  Enum = ' ',
  Keyword = ' ',
  Snippet = ' ',
  Color = ' ',
  File = ' ',
  Reference = ' ',
  Folder = ' ',
  EnumMember = ' ',
  Constant = ' ',
  Struct = ' ',
  Event = ' ',
  Operator = ' ',
  TypeParameter = ' ',
}

M.diagnostic = {
  float_diagnostic = {
    enable = false,
    updatetime = 250
  },
  config = {
    virtual_text = {
      source = "always",
      prefix = "●",
    },
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
  gopls = {},
  --clangd = {},
  lua_ls = {},
  omnisharp = {},
  rust_analyzer = {}
}

return M
