local M = {}

vim.scriptencoding = 'utf-8'

M.config = {
    noplugin = false,
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
    expandtab = true,
    scrolloff = 5,
    inccommand = 'split',
    ignorecase = true,
    smarttab = true,
    breakindent = true,
    shiftwidth = 4,
    tabstop = 4,
    colorcolumn = "80",
    ai = true,
    si = true,
    wrap = false,
    backspace = 'start,eol,indent',

    cursorline = true,
    termguicolors = true,
    background = 'dark',
}

M.globals = {
    maplocalleader = ' ',
    mapleader = ' ',
}

return M
