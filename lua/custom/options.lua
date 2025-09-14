local M = {}
local opt = vim.opt

vim.scriptencoding = 'utf-8'

opt.winblend = 30
opt.autoindent = true
opt.background = 'dark'
opt.backspace = 'start,eol,indent'
opt.backup = false
opt.backupskip = '/tmp/*,'
opt.breakindent = true
opt.clipboard = 'unnamedplus'
opt.cmdheight = 1
opt.colorcolumn = '80'
opt.completeopt = 'menuone,noselect,popup'
opt.cursorline = false
opt.encoding = 'utf-8'
opt.expandtab = false
opt.fileencoding = 'utf-8'
opt.fillchars = {
  eob = ' ',
  fold = ' ',
  foldclose = '>',
  foldopen = 'v',
  foldsep = ' ',
}
--opt.guicursor = ''
opt.hlsearch = true
opt.inccommand = 'split'
opt.laststatus = 0
opt.list = true
opt.listchars = {
  --tab = '>-',
  trail = '+',
}
opt.number = true
opt.relativenumber = true
opt.scrolloff = 5
opt.shiftwidth = 8
opt.showcmd = true
opt.showmode = false
opt.signcolumn = 'yes'
opt.smartindent = true
opt.smarttab = true
opt.splitbelow = true
opt.splitkeep = "screen"
opt.splitright = true
opt.tabstop = 8
opt.termguicolors = true
opt.title = true
opt.winborder = ""
opt.wrap = true

vim.g.netrw_banner = 0

return M
