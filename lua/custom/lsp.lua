local severity = vim.diagnostic.severity
local M = {}

M.diagnostic = {
  virtual_text = false,
  virtual_lines = true,
  float = {
    source = 'always',
  },
  signs = {
    text = {
      [severity.ERROR] = '󰅚 ',
      [severity.WARN] = '󰀪 ',
      [severity.INFO] = ' ',
      [severity.HINT] = '󰌶 '
    }
  },
  update_in_insert = true,
}

M.servers = {
  'clangd',
  'gopls',
  'lua_ls',
  'pyright',
}

local function set_keymap()
  require('core.keymaps').keymaps_set_all({
    n = {
      ['gh'] = vim.lsp.buf.hover,
      ['gll'] = vim.diagnostic.open_float,
      ['gd'] = vim.lsp.buf.definition,
      ['gD'] = vim.lsp.buf.declaration,
      ['grr'] = ':Telescope lsp_references<cr>',
      ['grq'] = vim.lsp.buf.references,
      ['ga'] = vim.lsp.buf.code_action,
      ['<leader>ll'] = ':Telescope diagnostics<cr>',
      ['<leader>ln'] = vim.diagnostic.goto_next,
      ['<leader>lp'] = vim.diagnostic.goto_prev,
      ['<leader>lf'] = vim.lsp.buf.format,
    },
  })
end

function M.setup()
  for _, server in ipairs(M.servers) do
    vim.lsp.enable(server)
  end
  vim.diagnostic.config(M.diagnostic)
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function (args)
      set_keymap()
      if require('custom.config').native_complete then
        require('core.complete').setup(args)
      end
    end
  })
end

return M
