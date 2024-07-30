local M = {}

M.config_root = vim.fn.stdpath("config") .. "/lua/"
M.data_root = vim.fn.stdpath("data")
M.plugins_root = M.data_root .. "/lazy/"

M.get_plugin_dir = function (name)
    return M.plugins_root .. name
end

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

return M
