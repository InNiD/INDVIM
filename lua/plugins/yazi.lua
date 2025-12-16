return {
    "mikavilpas/yazi.nvim",
    version = "*", -- use the latest stable version
    dependencies = {
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    keys = {
        {
            "<leader>oc",
            "<cmd>Yazi<cr>",
            desc = "Open current file",
        },
        {
            -- Open in the current working directory
            "<leader>ow",
            "<cmd>Yazi cwd<cr>",
            desc = "Open working directory",
        },
        {
            "<leader>or",
            "<cmd>Yazi toggle<cr>",
            desc = "Resume the last yazi session",
        },
    },
    ---@type YaziConfig | {}
    opts = {
        -- if you want to open yazi instead of netrw, see below for more info
        open_for_directories = false,
        keymaps = {
            -- show_help = "<f1>",
        },
    },
}
