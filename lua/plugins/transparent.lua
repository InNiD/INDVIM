return {
    "xiyaowong/transparent.nvim",
    enabled = false,
    verison = "*",
    opts = {
        -- table: additional groups that should be cleared
        extra_groups = {
            "NormalFloat",
            "NvimTreeNormal",
        },
        -- table: groups you don't want to clear
        exclude_groups = {
            "CursorLine",
        },
    },
}
