return {
    "echasnovski/mini.pairs",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        modes = { insert = true, command = true, terminal = false },
        skip_ts = { "string" },
        skip_unbalanced = true,
        markdown = true,
    }
}
