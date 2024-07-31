local M = {}

M.kind_icons = {
    Text = ' ',
    Method = ' ',
    Function = ' ',
    Constructor = ' ',
    Field = ' ',
    Variable = ' ',
    Class = ' ',
    Interface = ' ',
    Module = ' ',
    Property = ' ',
    Unit = ' ',
    Value = ' ',
    Enum = ' ',
    Keyword = ' ',
    Snippet = ' ',
    Color = ' ',
    File = ' ',
    Reference = ' ',
    Folder = ' ',
    EnumMember = ' ',
    Constant = ' ',
    Struct = ' ',
    Event = ' ',
    Operator = ' ',
    TypeParameter = ' ',
}

M.diagnostic = {
    float_diagnostic = {
        enable = false,
        updatetime = 250
    },
    config = {
        virtual_text = {
            source = "always",
            prefix = "●",
        },
        float = {
            source = "always",
        },
        update_in_insert = true,
    }
}

M.servers = {
    'clangd',
    'lua_ls',
    'tsserver',
    'omnisharp',
    'rust_analyzer'
}

M.signs = {
    Error = "󰅚 ",
    Warn = "󰀪 ",
    Hint = "󰌶 ",
    Info = " "
}

M.float_diagnostic = function ()
    vim.o.updatetime = M.diagnostic.float_diagnostic.updatetime
    vim.api.nvim_create_autocmd("CursorHold", {
        buffer = bufnr,
        callback = function()
            vim.diagnostic.open_float(nil, {
                focusable = false,
                close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
                source = 'always',
                prefix = ' ',
                scope = 'cursor',
            })
        end
    })
end

M.init = function ()
    vim.diagnostic.config(M.diagnostic.config)

    if M.diagnostic.float_diagnostic.enable then
        M.float_diagnostic()
    end
end

return M
