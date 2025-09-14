local use_native = require('custom.config').native_complete
local opts = {
  signature = { enabled = true, },
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

opts.keymap = {
  preset = 'none',
  ['<c-o>'] = { 'show',                      'fallback' },
  ['<c-b>'] = { 'snippet_backward',          'fallback' },
  ['<c-f>'] = { 'snippet_forward',           'fallback' },
  ['<c-d>'] = { 'scroll_documentation_down', 'fallback' },
  ['<c-u>'] = { 'scroll_documentation_up',   'fallback' },
  ['<c-n>'] = { 'select_next',               'fallback' },
  ['<c-p>'] = { 'select_prev',               'fallback' },
  ['<c-e>'] = { 'cancel',                    'fallback' },
  ['<c-y>'] = { 'accept',                    'fallback' },
  ['<tab>'] = { 'select_and_accept',         'fallback' },
}

opts.completion = {
  menu = {
    max_height = 8,
    draw = {
      padding = { 1, 1 },
      columns = {
        { 'label', 'label_description', gap = 1 },
        { 'source_name' },
      },
    },
  },
  documentation = {
    auto_show = true,
    auto_show_delay_ms = 0,
  },
}

local M = {
  'saghen/blink.cmp',
  enabled = not use_native,
  event = {
    'InsertEnter',
    'CmdlineEnter'
  },
  dependencies = { 'rafamadriz/friendly-snippets' },
  version = '1.*',
  opts = opts,
}

return M
