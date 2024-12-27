local M = {}

M.config_root = vim.fn.stdpath("config") .. "/lua/"
M.data_root = vim.fn.stdpath("data")
M.plugins_root = M.data_root .. "/lazy/"

M.get_plugin_dir = function (name)
  return M.plugins_root .. name
end

---Check file is exists.
---@param path string
---@return boolean
M.file_exists = function (path)
  local f = io.open(path, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

M.config_file_exists = function (path)
  return M.file_exists(M.config_root .. path)
end

---Echo some text and wait until user press any key to exit nvim.
---Use 'vim.api.nvim_echo' to echo some text.
---So need same parameters as 'nvim_echo'.
---@param chunks table
---@param history boolean
---@param opts table
M.echo_exit = function (chunks, history, opts)
  table.insert(chunks, { "Press any key to exit...\n" })
  vim.api.nvim_echo(chunks, history, opts)
  vim.fn.getchar()
  os.exit(1)
end

---Echo some text and wait until user press any key.
---Use 'vim.api.nvim_echo' to echo some text.
---So need same parameters as 'nvim_echo'.
---@param chunks table
---@param history boolean
---@param opts table
M.echo_wait = function (chunks, history, opts)
  table.insert(chunks, { "Press any key to continue\n" })
  vim.api.nvim_echo(chunks, history, opts)
  vim.fn.getchar()
end

return M
