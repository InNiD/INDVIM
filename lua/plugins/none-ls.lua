return {
    "nvimtools/none-ls.nvim",
    version = "*",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local registry = require "mason-registry"
        local function setup(name)
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end
        end
        setup("verible")
        local null_ls = require("null-ls")
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.verible_verilog_format,
            },
        })
    end,
    keys = {
        {
            "<leader>lf",
            function()
                local active_client = vim.lsp.get_clients { bufnr = 0, name = "null-ls" }

                local format_option = { async = true }
                if #active_client > 0 then
                    format_option.name = "null-ls"
                end
                vim.lsp.buf.format(format_option)
            end,
            mode = { "n", "v" },
            desc = "format",
        },
    },
}
