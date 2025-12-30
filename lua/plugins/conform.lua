return {
    'stevearc/conform.nvim',
    version = "*",
    opts = {
        formatters_by_ft = {
            verilog = { "verible" },
            systemverilog = { "verible" },
        },
    },
    keys = {
        {
            "<leader>lf",
            function()
                vim.lsp.buf.format({ async = true })
            end,
        }
    }
}
