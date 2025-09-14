vim.g.maplocalleader = ' '
vim.g.mapleader = ' '

local mappings = {
  n = {
    ['<c-n>'] = '<cmd>bnext<cr>',
    ['<c-p>'] = '<cmd>bprev<cr>',
    ['<c-h>'] = '<c-w>h',
    ['<c-j>'] = '<c-w>j',
    ['<c-k>'] = '<c-w>k',
    ['<c-l>'] = '<c-w>l',

    ['<leader>b'] = '<cmd>b#<cr>',
    ['<leader>e'] = '<cmd>Ex<cr>',
    ['<leader>nh'] = '<cmd>nohl<cr>',
    ['<leader>w'] = '<cmd>w<cr>',
    ['<leader>q'] = '<cmd>q<cr>',
    ['<leader>s'] = [[:%s/\<<c-r><c-w>\>/\<<c-r><c-w>\>/g<left><left>]],

    -- quickfix
    ['<leader>co'] = '<cmd>:copen<cr>',
    ['<leader>cn'] = '<cmd>:cnext<cr>',
    ['<leader>cp'] = '<cmd>:cprev<cr>',

    -- tab
    ['<leader><c-n>'] = '<cmd>:tabnext<cr>',
    ['<leader><c-p>'] = '<cmd>:tabprev<cr>',
    ['<leader>tn'] = '<cmd>:tabnext<cr>',
    ['<leader>tp'] = '<cmd>:tabprev<cr>',

    ['<leader>to'] = '<cmd>:tabnew %<cr>',
    ['<leader>tq'] = '<cmd>:tabclose<cr>',
    ['<leader>tt'] = '<cmd>:tabs<cr>:tabn ',
    ['<leader>tx'] = '<cmd>:tabclose<cr>',

    ['<leader>t1'] = '<cmd>:tabn 1<cr>',
    ['<leader>t2'] = '<cmd>:tabn 2<cr>',
    ['<leader>t3'] = '<cmd>:tabn 3<cr>',
    ['<leader>t4'] = '<cmd>:tabn 4<cr>',
    ['<leader>t5'] = '<cmd>:tabn 5<cr>',
    ['<leader>t6'] = '<cmd>:tabn 6<cr>',
    ['<leader>t7'] = '<cmd>:tabn 7<cr>',
    ['<leader>t8'] = '<cmd>:tabn 8<cr>',
    ['<leader>t9'] = '<cmd>:tabn 9<cr>',

    ['<leader>ta'] = '<cmd>:tabn 1<cr>',
    ['<leader>ts'] = '<cmd>:tabn 2<cr>',
    ['<leader>td'] = '<cmd>:tabn 3<cr>',
    ['<leader>tf'] = '<cmd>:tabn 4<cr>',
    ['<leader>tg'] = '<cmd>:tabn 5<cr>',
    ['<leader>th'] = '<cmd>:tabn 6<cr>',
    ['<leader>tj'] = '<cmd>:tabn 7<cr>',
    ['<leader>tk'] = '<cmd>:tabn 8<cr>',
    ['<leader>tl'] = '<cmd>:tabn 9<cr>',
  },
  v = {
    ['<c-f>'] = '<right>',
    ['<c-b>'] = '<left>',
    ['<c-n>'] = '<down>',
    ['<c-p>'] = '<up>',
  },
  i = {
    ['jk'] = '<esc>',
    ['<c-f>'] = '<right>',
    ['<c-b>'] = '<left>',
    ['<c-n>'] = '<down>',
    ['<c-p>'] = '<up>',
  },
}

require('core.keymaps').keymaps_set_all(mappings)
