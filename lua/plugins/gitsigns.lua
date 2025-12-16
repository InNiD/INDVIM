return {
    "lewis6991/gitsigns.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
        require('gitsigns').setup()
    end,
}
