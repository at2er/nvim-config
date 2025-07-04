local M = {}
local lsp = require('custom.lsp')

vim.scriptencoding = 'utf-8'

M.config = {
  native_complete = false,
  noplugin = false,
  --colorscheme = "simple-night",
  colorscheme = "catppuccin-mocha",
  --default = {
  --    keymap_option = { noremap = true, silent = true },
  --},
}

M.options = {
  winblend = 30,
  ai = true,
  background = 'dark',
  backspace = 'start,eol,indent',
  backup = false,
  backupskip = '/tmp/*,',
  breakindent = true,
  clipboard = 'unnamedplus',
  cmdheight = 1,
  colorcolumn = "80",
  completeopt = 'menu,popup',
  cursorline = false,
  encoding = 'utf-8',
  expandtab = false,
  fileencoding = 'utf-8',
  fillchars = [[eob: ,fold: ,foldopen:v,foldclose:>,foldsep: ]],
  guicursor = '',
  hlsearch = true,
  inccommand = 'split',
  laststatus = 2,
  list = true,
  listchars = [[tab:>-,trail:+]],
  number = true,
  relativenumber = true,
  scrolloff = 5,
  shiftwidth = 8,
  showcmd = true,
  showmode = false,
  si = true,
  signcolumn = 'yes',
  smarttab = true,
  tabstop = 8,
  termguicolors = true,
  title = true,
  wrap = true,
}

M.globals = {
  maplocalleader = ' ',
  mapleader = ' ',
}

lsp.init()

return M
