local M = {}

M.opt = {
  enable = true,
  method = 'marker',
  virtual_text = {
    enable = true,
  },
}

-- {{{
function M.custom_foldtext()
  local line = vim.fn.getline(vim.v.foldstart)
  local foldnum = vim.v.foldend - vim.v.foldstart
  local result = ' ' .. line .. 'lines: ' .. foldnum
  return result
end
-- }}}

function M.setup()
  if not M.opt.enable then
    return
  end
  vim.o.foldenable = true
  vim.o.foldlevelstart = 99
  vim.o.foldmethod = M.opt.method
  if M.opt.virtual_text.enable then
    vim.opt.foldtext = 'v:lua.require("custom.fold").custom_foldtext()'
  end
end

return M
