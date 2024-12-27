local M = {}

vim.scriptencoding = 'utf-8'

M.config = {
  noplugin = false,
  colorscheme = "simple-night",
  --default = {
  --    keymap_option = { noremap = true, silent = true },
  --},
}

M.options = {
  clipboard = 'unnamedplus',
  encoding = 'utf-8',
  fileencoding = 'utf-8',

  relativenumber = true,
  number = true,

  title = true,
  autoindent = true,
  hlsearch = true,
  backup = false,
  backupskip = '/tmp/*,',
  showcmd = true,
  showmode = false,
  cmdheight = 1,
  laststatus = 2,
  expandtab = false,
  scrolloff = 5,
  inccommand = 'split',
  ignorecase = true,
  smarttab = true,
  breakindent = true,
  shiftwidth = 8,
  tabstop = 8,
  colorcolumn = "80",
  ai = true,
  si = true,
  wrap = true,
  backspace = 'start,eol,indent',

  cursorline = false,
  termguicolors = true,
  background = 'dark',

  signcolumn = 'yes',

  fillchars = [[eob: ]],
  list = true,
  listchars = [[tab:>-,trail:+]],
}

M.globals = {
  maplocalleader = ' ',
  mapleader = ' ',
}

return M
