local M = {}

local gr = vim.api.nvim_create_augroup('my.completion', {})

local function au(event, pattern, callback)
  vim.api.nvim_create_autocmd(event, {
    group = gr,
    pattern = pattern,
    callback = callback
  })
end

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

function M.setup(args)
  local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
  vim.bo[args.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'
  if client:supports_method('textDocument/completion') then
    vim.lsp.completion.enable(true, client.id, args.buf, {
      autotrigger = true
    })
  end
  -- show popup on the side of the code suggestions
  au('CompleteChanged', '*', function()
    if vim.fn.pumvisible() == 1 then
      vim.schedule(hover)
    end
  end)
end

return M
