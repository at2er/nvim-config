local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local exec_aucmds = vim.api.nvim_exec_autocmds
local groups = {}

--groups.lazyload = augroup("MyNvimLazyLoad", { clear = true })
--autocmd("User", {
--    pattern = "VeryLazy",
--    group = groups.lazyload,
--    callback = function ()
--        local function _trigger()
--            exec_aucmds("User", { pattern = "MyVeryLazy" })
--        end
--
--        if vim.bo.filetype == "dashboard" then
--            autocmd("BufReadPost", {
--                once = true,
--                callback = _trigger,
--            })
--        else
--            _trigger()
--        end
--    end
--})
