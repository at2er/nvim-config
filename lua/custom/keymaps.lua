local M = {}
local opt = { noremap = true, silent = true }

-- Don't put any plugin's mappings in this table.
M.mappings =  {}
M.mappings.n = {
    ['<c-n>'] = "<cmd>bnext<cr>",
    ['<c-p>'] = "<cmd>bprev<cr>",
    ['<c-h>'] = "<c-w>h",
    ['<c-j>'] = "<c-w>j",
    ['<c-k>'] = "<c-w>k",
    ['<c-l>'] = "<c-w>l",
    ['<leader>nh'] = "<cmd>set nohlsearch<cr>",
}

M.mappings.v = {
    ['<c-f>'] = '<right>',
    ['<c-b>'] = '<left>',
    ['<c-n>'] = '<down>',
    ['<c-p>'] = '<up>',
}

M.mappings.i = {
    ['<c-f>'] = '<right>',
    ['<c-b>'] = '<left>',
    ['<c-n>'] = '<down>',
    ['<c-p>'] = '<up>',
}

-- Put plugin's mappings in this table only.
M.plugin = {}
M.plugin.auto_set = { "telescope" }

M.plugin.telescope = function ()
    return {
        n = {
            ['<leader>ff'] = "<cmd>Telescope find_files<cr>",
            ['<leader>fg'] = "<cmd>Telescope live_grep<cr>",
            ['<leader>fb'] = "<cmd>Telescope buffers<cr>",
            ['<leader>fh'] = "<cmd>Telescope help_tags<cr>",
        }
    }
end

M.plugin.cmp = function (cmp)
    local mapping = cmp.mapping
    return {
        ['<c-b>'] = mapping.scroll_docs(-4),
        ['<c-f>'] = mapping.scroll_docs(4),
        ['<c-n>'] = mapping.select_next_item(),
        ['<c-p>'] = mapping.select_prev_item(),
        ['<c-o>'] = mapping.complete(),
        ['<c-e>'] = mapping.abort(),
        ['<tab>'] = mapping.confirm({ select = true }),
    }
end

return M
