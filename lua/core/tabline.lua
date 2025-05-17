local M = {}
local vim = vim
local fn = vim.fn

M.opts = {
  index = {
    show = true,
    suffix = ':'
  },
  modify = {
    show = true,
    style = { text = '[+]', hl = 'TabLineModify' },
  },
  diagnostic = {
    show = true,
    style = {
      error = { text = 'E:', hl = 'TabLineDiagError' },
      warn = { text = 'W:', hl = 'TabLineDiagWarn' },
      info = { text = 'I:', hl = 'TabLineDiagInfo' },
      hint = { text = 'H:', hl = 'TabLineDiagHint' },
    },
  },
  no_name = '[No Name]',
  separator = ' ',
}

function M.get_text(style, str, colored)
  if colored then
    return '%#' .. style.hl .. '#' .. style.text .. str .. '%#' .. 'TabLine' .. '#'
  end
  return style.text .. str
end

function M.diagnostic(opts)
  local s = ''
  local count = vim.diagnostic.count(0)
  local err = count[vim.diagnostic.severity.ERROR]
  local warn = count[vim.diagnostic.severity.WARN]
  local info = count[vim.diagnostic.severity.INFO]
  local hint = count[vim.diagnostic.severity.HINT]
  if err then
    s = s .. M.get_text(opts.diagnostic.style.error, err, 0)
  end
  if warn then
    s = s .. M.get_text(opts.diagnostic.style.warn, warn, 0)
  end
  if info then
    s = s .. M.get_text(opts.diagnostic.style.info, info, 0)
  end
  if hint then
    s = s .. M.get_text(opts.diagnostic.style.hint, hint, 0)
  end
  return s
end

function M.tabline(opts)
  local s = ''
  for index = 1, fn.tabpagenr('$') do
    local winnr = fn.tabpagewinnr(index)
    local buflist = fn.tabpagebuflist(index)
    local bufnr = buflist[winnr]
    local bufname = fn.bufname(bufnr)
    local bufmodified = fn.getbufvar(bufnr, '&mod')
    s = index == fn.tabpagenr() and s .. '%#TabLineSel#' or s .. '%#TabLine#'
    s = s .. opts.separator
    s = opts.index.show and s .. index .. opts.index.suffix or s
    s = bufname == '' and s .. opts.no_name or s .. bufname
    if opts.diagnostic.show then
      s = s .. M.diagnostic(opts)
    end
    if opts.modify.show and bufmodified then
      s = s .. M.get_text(opts.modify.style, '')
    end
    s = index == fn.tabpagenr('$') and s .. ' %#TabLineFill#' or s .. opts.separator
  end
  return s
end

function M.setup(opts)
  function _G.nvim_tabline()
    return M.tabline(M.opts)
  end
  vim.o.tabline = '%!v:lua.nvim_tabline()'
end

return M
