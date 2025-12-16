return {
    "nvim-lualine/lualine.nvim",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    version = "*",
    event = "VeryLazy",
    opts = {
        options = {
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
        },
        extensions = { "nvim-tree" },
        sections = {
            lualine_b = { "branch", "diff" },
            lualine_c = { "filetype" },
            lualine_x = { "filesize" }
        },
    },
}
