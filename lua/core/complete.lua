local M = {}
local function hover()
  local params = vim.lsp.util.make_position_params()
  local pum_pos = vim.fn.pum_getpos()
  local menu_width = pum_pos and pum_pos.width or 0
  vim.lsp.buf_request(0, 'textDocument/hover', params, vim.lsp.with(
    vim.lsp.handlers.hover, {
      -- Popup adjustment
      offset_x = menu_width,
      offset_y = 0,
      max_width = 70,
      max_height = 20,
    }
  ))
end

function M.setup(buf)
  vim.bo[buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  -- show popup on the side of the code suggestions
  vim.api.nvim_create_autocmd('CompleteChanged', {
    pattern = '*',
    callback = function()
      if vim.fn.pumvisible() == 1 then
        vim.schedule(hover)
      end
    end,
  })
end

return M
