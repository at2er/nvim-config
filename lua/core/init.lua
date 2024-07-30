local M = {}
local utils = require("core.utils")
local keymaps_utils = require("core.keymaps")
local custom_options = {}
local custom_keymaps = {}
M.applied_custom_options = false
M.applied_custom_keymaps = false

M.apply_custom_options = function ()
    if not utils.config_file_exists("custom/options.lua") then
        print("cannot find \"custom/options.lua\" in your config")
        return false
    end

    custom_options = require("custom.options")
    for k, v in pairs(custom_options.options) do
        vim.opt[k] = v
    end

    for k, v in pairs(custom_options.globals) do
        vim.g[k] = v
    end

    M.applied_custom_options = true
    return true
end

M.apply_custom_keymaps = function ()
    if not utils.config_file_exists("custom/keymaps.lua") then
        print("cannot find \"custom/keymaps.lua\" in your config")
        return false
    end

    local keymaps = require("custom.keymaps")
    local plugin = keymaps.plugin
    keymaps_utils.keymaps_set_all(keymaps.mappings)

    if #plugin.auto_set ~= 0 then
        for _, v in pairs(plugin.auto_set) do
            keymaps_utils.keymaps_set_all(plugin[v]())
        end
    end

    if not M.applied_custom_options then
        M.applied_custom_options()
    end

    M.applied_custom_keymaps = true
    return true
end

M.lazy_nvim_init = function ()
    require("core.lazy")
end

M.init = function ()
    M.apply_custom_options()
    M.apply_custom_keymaps()

    M.lazy_nvim_init()
end

return M
