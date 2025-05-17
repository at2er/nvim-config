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
  ['<leader>nh'] = "<cmd>nohl<cr>",
  ['<leader>ll'] = "<cmd>Lazy<cr>",
  ['<leader>w'] = "<cmd>w<cr>",
  ['<leader>q'] = "<cmd>q<cr>",
  ['<leader>b'] = "<cmd>b#<cr>",
  ['<leader>s'] = "<cmd>buffers<cr>:b ",
  ['<leader><c-n>'] = "<cmd>:tabnext<cr>",
  ['<leader><c-p>'] = "<cmd>:tabprev<cr>",
  ['<leader>tt'] = "<cmd>:tabs<cr>:tabn ",
  ['<leader>tn'] = "<cmd>:tabnew<cr>",

  ['<leader>co'] = "<cmd>:copen<cr>",
  ['<leader>cn'] = "<cmd>:cnext<cr>",
  ['<leader>cp'] = "<cmd>:cprev<cr>",

  ['<leader>t1'] = "<cmd>:tabn 1<cr>",
  ['<leader>t2'] = "<cmd>:tabn 2<cr>",
  ['<leader>t3'] = "<cmd>:tabn 3<cr>",
  ['<leader>t4'] = "<cmd>:tabn 4<cr>",
  ['<leader>t5'] = "<cmd>:tabn 5<cr>",
  ['<leader>t6'] = "<cmd>:tabn 6<cr>",
  ['<leader>t7'] = "<cmd>:tabn 7<cr>",
  ['<leader>t8'] = "<cmd>:tabn 8<cr>",
  ['<leader>t9'] = "<cmd>:tabn 9<cr>",

  ['<leader>ta'] = "<cmd>:tabn 1<cr>",
  ['<leader>ts'] = "<cmd>:tabn 2<cr>",
  ['<leader>td'] = "<cmd>:tabn 3<cr>",
  ['<leader>tf'] = "<cmd>:tabn 4<cr>",
  ['<leader>tg'] = "<cmd>:tabn 5<cr>",
  ['<leader>th'] = "<cmd>:tabn 6<cr>",
  ['<leader>tj'] = "<cmd>:tabn 7<cr>",
  ['<leader>tk'] = "<cmd>:tabn 8<cr>",
  ['<leader>tl'] = "<cmd>:tabn 9<cr>",
}

M.mappings.v = {
  ['<c-f>'] = '<right>',
  ['<c-b>'] = '<left>',
  ['<c-n>'] = '<down>',
  ['<c-p>'] = '<up>',
}

M.mappings.i = {
  ['jk'] = '<esc>',
  ['<c-f>'] = '<right>',
  ['<c-b>'] = '<left>',
  ['<c-n>'] = '<down>',
  ['<c-p>'] = '<up>',
}

-- Put plugin's mappings in this table only.
M.plugin = {}
--M.plugin.auto_set = {} -- disable auto set plugin's mappings
M.plugin.auto_set = { "telescope", "conform", "yazi", "dap" }

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

M.plugin.cmp = function ()
  return {
    preset = 'none',
    ['<c-b>'] = { 'snippet_backward',          'fallback' },
    ['<c-f>'] = { 'snippet_forward',           'fallback' },
    ['<c-d>'] = { 'scroll_documentation_down', 'fallback' },
    ['<c-u>'] = { 'scroll_documentation_up',   'fallback' },
    ['<c-n>'] = { 'select_next',               'fallback' },
    ['<c-p>'] = { 'select_prev',               'fallback' },
    ['<c-e>'] = { 'cancel',                    'fallback' },
    ['<tab>'] = { 'select_and_accept',         'fallback' },
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

M.plugin.yazi = function ()
  return {
    n = {
      ['<leader>e'] = '<cmd>Yazi toggle<cr>',
    }
  }
end

M.plugin.dap = function ()
  return {
    n = {
      ['<leader>db'] = "<cmd>DapToggleBreakpoint<cr>",
      ['<leader>dc'] = "<cmd>DapContinue<cr>",
      ['<leader>do'] = "<cmd>DapStepOut<cr>",
      ['<leader>dO'] = "<cmd>DapStepOver<cr>",
      ['<leader>di'] = "<cmd>DapStepInto<cr>",
      ['<leader>dr'] = "<cmd>DapToggleRepl<cr>",
      ['<F5>'] = "<cmd>DapContinue<cr>",
    }
  }
end

return M
