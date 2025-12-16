return {
    "lukas-reineke/indent-blankline.nvim",
    version = "*",
    event = "VeryLazy",
    main = "ibl",
    opts = {
        exclude = {
            filetypes = { "dashboard", "terminal", "help", "log", "markdown", "TelescopePrompt" },
        },
    },
}
