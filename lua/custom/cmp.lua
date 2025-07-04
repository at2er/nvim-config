local M = {}

M.opts = {
  keymap = require('custom.keymaps').plugin.cmp(),
  completion = {
    menu = {
      max_height = 8,
      draw = {
        padding = { 1, 1 },
        components = {
          source_name = {
            text = function(ctx) return '[' .. ctx.source_name .. ']' end
          }
        },
        columns = {
          { "label", "label_description", gap = 1 },
          { "source_name" },
        },
      },
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 0,
    },
  },
  signature = {
    enabled = true,
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono'
  },
  sources = {
    providers = {
      buffer = { score_offset = 1000 },
      lsp    = { score_offset = 999  },
      path   = { score_offset = 998  },
    },
  },
}

return M
