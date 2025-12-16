return {
    "nvim-tree/nvim-tree.lua",
    enabled = false,
    version = "*",
    lazy = false,
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    opts = {
        actions = {
            open_file = { quit_on_open = true, },
        },
    },
    keys = {
        { "<leader>to", ":NvimTreeToggle<CR>", { silence = true } },
    },
}
