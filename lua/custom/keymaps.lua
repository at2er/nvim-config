local M = {}
local opt = { noremap = true, silent = true }

-- Don't put any plugin's mappings in this table.
M.mappings =  {}
M.mappings.n = {
  ['<c-n>'] = "<cmd>bnext<cr>",
  ['<c-p>'] = "<cmd>bprev<cr>",
  ['<c-h>'] = "<c-w>h",
  ['<c-j>'] = "<c-w>j",
  ['<c-k>'] = "<c-w>k",
  ['<c-l>'] = "<c-w>l",
  ['<leader>nh'] = "<cmd>set nohlsearch<cr>",
  ['<leader>ll'] = "<cmd>Lazy<cr>",
  ['<leader>w'] = "<cmd>w<cr>",
  ['<leader>q'] = "<cmd>q<cr>",
  ['<leader>b'] = "<cmd>b#<cr>",
  ['<leader>s'] = "<cmd>buffers<cr>:",
}

M.mappings.v = {
  ['<c-f>'] = '<right>',
  ['<c-b>'] = '<left>',
  ['<c-n>'] = '<down>',
  ['<c-p>'] = '<up>',
}

M.mappings.i = {
  ['<c-f>'] = '<right>',
  ['<c-b>'] = '<left>',
  ['<c-n>'] = '<down>',
  ['<c-p>'] = '<up>',
}

-- Put plugin's mappings in this table only.
M.plugin = {}
--M.plugin.auto_set = {} -- disable auto set plugin's mappings
M.plugin.auto_set = { "telescope", "conform", "neotree", "dap" }

M.plugin.telescope = function ()
  return {
    n = {
      ['<leader>ff'] = "<cmd>Telescope find_files<cr>",
      ['<leader>fg'] = "<cmd>Telescope live_grep<cr>",
      ['<leader>fb'] = "<cmd>Telescope buffers<cr>",
      ['<leader>fh'] = "<cmd>Telescope help_tags<cr>",
    }
  }
end

M.plugin.cmp = function (cmp)
  local mapping = cmp.mapping
  return {
    ['<c-b>'] = mapping.scroll_docs(-4),
    ['<c-f>'] = mapping.scroll_docs(4),
    ['<c-n>'] = mapping.select_next_item(),
    ['<c-p>'] = mapping.select_prev_item(),
    ['<c-o>'] = mapping.complete(),
    ['<c-e>'] = mapping.abort(),
    ['<tab>'] = mapping.confirm({ select = true }),
  }
end

M.plugin.conform = function ()
  return {
    n = {
      ['<leader>F'] = function ()
        local conform = require('conform')
        conform.format({ async = true })
      end
    }
  }
end

M.plugin.lsp = function ()
  local lsp = vim.lsp
  return {
    n = {
      ['gh'] = lsp.buf.hover,
      ['gll'] = vim.diagnostic.open_float,
      ['gd'] = lsp.buf.definition,
      ['gD'] = lsp.buf.declaration,
      ['gr'] = lsp.buf.references,
      ['ga'] = lsp.buf.code_action,
      ['<leader>ln'] = vim.diagnostic.goto_next,
      ['<leader>lp'] = vim.diagnostic.goto_prev,
      ['<leader>lf'] = lsp.buf.format,
    }
  }
end

M.plugin.neotree = function ()
  return {
    n = {
      ['<leader>e'] = "<cmd>Neotree toggle<cr>"
    }
  }
end

M.plugin.dap = function ()
  return {
    n = {
      ["<leader>db"] = "<cmd>DapToggleBreakpoint<cr>",
      ["<leader>dc"] = "<cmd>DapContinue<cr>",
      ["<F5>"] = "<cmd>DapContinue<cr>",
    }
  }
end

return M
