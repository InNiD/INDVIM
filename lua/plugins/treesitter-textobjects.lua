return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    event = "VeryLazy",
    dependencies = {
        "nvim-treesitter/nvim-treesitter",
    },
    config = function()
        vim.keymap.set({ "x", "o" }, "ab", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@block.outer", "textobjects")
        end)
        vim.keymap.set({ "x", "o" }, "ib", function()
            require "nvim-treesitter-textobjects.select".select_textobject("@block.inner", "textobjects")
        end)
        vim.keymap.set({ "n", "x", "o" }, "]b", function()
            require("nvim-treesitter-textobjects.move").goto_next_start("@block.outer", "textobjects")
        end)
        vim.keymap.set({ "n", "x", "o" }, "[b", function()
            require("nvim-treesitter-textobjects.move").goto_previous_start("@block.outer", "textobjects")
        end)
    end,
}
