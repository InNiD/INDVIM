return {
    "mason-org/mason.nvim",
    version = "*",
    event = "VeryLazy",
    opts = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        }
    },
    config = function (_, opts)
        require("mason").setup(opts)
        local registry = require "mason-registry"

        local function setup(name, config)
            local success, package = pcall(registry.get_package, name)
            if success and not package:is_installed() then
                package:install()
            end
            -- config.on_attach = function (client)
            --     client.server_capabilities.documentFormattingProvider = false
            --     client.server_capabilities.documentRangeFormattingProvider = false
            -- end
            vim.lsp.config(name, config)
        end

        setup(
            "verible",
            {
                cmd = { "verible-verilog-ls", "--indentation_spaces=4" },
                filetypes = { "systemverilog", "verilog" },
                root_markers = { ".git" },
            }
        )

        vim.lsp.enable({ "verible" })
    end,
}
