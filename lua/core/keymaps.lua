local M = {}
M.default_opt = { noremap = true, silent = true }

M.keymap_set = function (mode, key, map)
    local map_type = type(map)
    if map_type == "string" or map_type == "function" then
        vim.keymap.set(mode, key, map, M.default_opt)
    elseif map_type == "table" then
        if #map == 1 then
            vim.keymap.set(mode, key, map[1], M.default_opt)
        else
            vim.keymap.set(mode, key, map[1], map["opt"])
        end
    else
        return false
    end
    return true
end

M.keymaps_set = function (mode, mappings)
    for key, map in pairs(mappings) do
        M.keymap_set(mode, key, map)
    end
end

M.keymaps_set_all = function (mappings)
    for mode, _ in pairs(mappings) do
        M.keymaps_set(mode, mappings[mode])
    end
end

return M
