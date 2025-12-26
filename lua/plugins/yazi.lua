return {
    "mikavilpas/yazi.nvim",
    version = "*",
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
        open_for_directories = false,
        keymaps = {
            -- show_help = "<f1>",
        },
    },
}
