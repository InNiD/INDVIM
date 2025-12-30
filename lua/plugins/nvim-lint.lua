return {
    "mfussenegger/nvim-lint",
    version = "*",
    event = "VeryLazy",
    config = function()
        require('lint').linters_by_ft = {
            verilog = { "verilator" },
        }
        vim.api.nvim_create_autocmd({ "BufWritePost" }, {
            callback = function()
                require("lint").try_lint()
                -- require("lint").try_lint("cspell")
            end,
        })
    end,
}
