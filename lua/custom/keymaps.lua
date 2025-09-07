local M = {}

-- Don't put any plugin's mappings in this table.
M.mappings =  {}
M.mappings.n = {
  ['<c-n>'] = '<cmd>bnext<cr>',
  ['<c-p>'] = '<cmd>bprev<cr>',
  ['<c-h>'] = '<c-w>h',
  ['<c-j>'] = '<c-w>j',
  ['<c-k>'] = '<c-w>k',
  ['<c-l>'] = '<c-w>l',
  ['<leader>nh'] = '<cmd>nohl<cr>',
  ['<leader>ll'] = '<cmd>Lazy<cr>',
  ['<leader>w'] = '<cmd>w<cr>',
  ['<leader>q'] = '<cmd>q<cr>',
  ['<leader>b'] = '<cmd>b#<cr>',
  ['<leader><c-n>'] = '<cmd>:tabnext<cr>',
  ['<leader><c-p>'] = '<cmd>:tabprev<cr>',
  ['<leader>tt'] = '<cmd>:tabs<cr>:tabn ',
  ['<leader>tn'] = '<cmd>:tabnew<cr>',

  ['<leader>co'] = '<cmd>:copen<cr>',
  ['<leader>cn'] = '<cmd>:cnext<cr>',
  ['<leader>cp'] = '<cmd>:cprev<cr>',

  ['<leader>t1'] = '<cmd>:tabn 1<cr>',
  ['<leader>t2'] = '<cmd>:tabn 2<cr>',
  ['<leader>t3'] = '<cmd>:tabn 3<cr>',
  ['<leader>t4'] = '<cmd>:tabn 4<cr>',
  ['<leader>t5'] = '<cmd>:tabn 5<cr>',
  ['<leader>t6'] = '<cmd>:tabn 6<cr>',
  ['<leader>t7'] = '<cmd>:tabn 7<cr>',
  ['<leader>t8'] = '<cmd>:tabn 8<cr>',
  ['<leader>t9'] = '<cmd>:tabn 9<cr>',

  ['<leader>ta'] = '<cmd>:tabn 1<cr>',
  ['<leader>ts'] = '<cmd>:tabn 2<cr>',
  ['<leader>td'] = '<cmd>:tabn 3<cr>',
  ['<leader>tf'] = '<cmd>:tabn 4<cr>',
  ['<leader>tg'] = '<cmd>:tabn 5<cr>',
  ['<leader>th'] = '<cmd>:tabn 6<cr>',
  ['<leader>tj'] = '<cmd>:tabn 7<cr>',
  ['<leader>tk'] = '<cmd>:tabn 8<cr>',
  ['<leader>tl'] = '<cmd>:tabn 9<cr>',
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

M.plugin.cmp = function ()
  return {
    preset = 'none',
    ['<c-o>'] = { 'show',                      'fallback' },
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

M.plugin.lsp = function ()
  local lsp = vim.lsp
  return {
    n = {
      ['gh'] = lsp.buf.hover,
      ['gll'] = vim.diagnostic.open_float,
      ['gd'] = lsp.buf.definition,
      ['gD'] = lsp.buf.declaration,
      ['grr'] = ':Telescope lsp_references<cr>',
      ['ga'] = lsp.buf.code_action,
      ['<leader>ll'] = ':Telescope diagnostics<cr>',
      ['<leader>ln'] = vim.diagnostic.goto_next,
      ['<leader>lp'] = vim.diagnostic.goto_prev,
      ['<leader>lf'] = lsp.buf.format,
    }
  }
end

M.plugin.dap = {
  { '<leader>db', '<cmd>DapToggleBreakpoint<cr>' },
  { '<leader>dB', function()
    require('dap').set_breakpoint(
      vim.fn.input('Condition for break point: '))
  end },
  { '<leader>dc', '<cmd>DapContinue<cr>' },
  { '<leader>dC', function() require('dap').run_to_cursor() end },
  { '<leader>de', function()
    require('dapui').eval(vim.fn.input('Expression: '))
  end },
  { '<leader>do', '<cmd>DapStepOut<cr>' },
  { '<leader>dO', '<cmd>DapStepOver<cr>' },
  { '<leader>di', '<cmd>DapStepInto<cr>' },
  { '<leader>dr', '<cmd>DapToggleRepl<cr>' },
  { '<leader>dR', function() require('dap').restart() end },
  { '<leader>dx', function() require('dap').close() end },
  { '<F5>', '<cmd>DapContinue<cr>' },
}

M.plugin.conform = {
  {'<leader>F', function () require('conform').format({ async = true }) end},
}

M.plugin.mini_files = {
  ---@diagnostic disable-next-line: undefined-global
  { '<leader>e', function() MiniFiles.open() end }
}

M.plugin.telescope = {
  { '<leader>s',  '<cmd>Telescope buffers<cr>'   },
  { '<leader>ff', '<cmd>Telescope find_files<cr>'},
  { '<leader>fg', '<cmd>Telescope live_grep<cr>' },
  { '<leader>fb', '<cmd>Telescope buffers<cr>'   },
  { '<leader>fh', '<cmd>Telescope help_tags<cr>' },
}

M.plugin.vim_swap = {
  { 'g<' },
  { 'g>' },
  { 'gs' },
}


return M
