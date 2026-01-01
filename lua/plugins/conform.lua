return {
    'stevearc/conform.nvim',
    version = "*",
    opts = {
        formatters_by_ft = {
            verilog = { "verible" },
            systemverilog = { "verible" },
        },
        formatters = {
            verible = {
                prepend_args = {
                    "--indentation_spaces=4",
                },
            },
        },
    },
    keys = {
        {
            "<leader>lf",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
        }
    }
}
