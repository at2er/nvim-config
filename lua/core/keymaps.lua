local M = {}
M.default_opt = { noremap = true, silent = true }

local function table_keymap_set(mode, key, map)
  vim.keymap.set(mode, key, map[1], map["opt"])
end

M.keymap_set = function (mode, key, map)
  local map_type = type(map)
  if map_type == "string" or map_type == "function" then
    vim.keymap.set(mode, key, map, M.default_opt)
  elseif map_type == "table" then
    if #map == 1 then
      vim.keymap.set(mode, key, map[1], M.default_opt)
      return false
    end
    table_keymap_set(mode, key, map)
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
