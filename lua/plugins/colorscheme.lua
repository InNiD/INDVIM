return {
    {
        "catppuccin/nvim",
        enabled = false,
        version = "*",
        lazy = false,
        priority = 1000,
        opts = {
            -- latte, frappe, macchiato, mocha
            flavour = "macchiato",
            auto_integrations = true,
            transparent_background = true,
            term_colors = true,
        },
        config = function(_, opts)
            require("catppuccin").setup(opts)
            vim.cmd.colorscheme("catppuccin")
        end,
    },
    {
        "folke/tokyonight.nvim",
        enabled = false,
        version = "*",
        lazy = false,
        priority = 1000,
        opts = {
            -- night, storm, moon, day
            style = "moon",
            transparent = true,
        },
        config = function(_, opts)
            require("tokyonight").setup(opts)
            vim.cmd.colorscheme("tokyonight")
        end,
    },
    {
        "sainnhe/everforest",
        enabled = false,
        version = "*",
        lazy = false,
        priority = 1000,
        config = function()
            -- hard, medium, soft
            vim.g.everforest_background = "soft"
            vim.g.everforest_enable_italic = true
            -- vim.g.everforest_transparent_background = 2
            -- vim.g.everforest_ui_contrast = "high"
            vim.g.everforest_show_eob = 0
            vim.g.everforest_diagnostic_virtual_text = "colored"
            vim.cmd.colorscheme("everforest")
        end,
    },
    {
        "shaunsingh/nord.nvim",
        enabled = false,
        version = "*",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.nord_disable_background = true
            vim.g.nord_uniform_diff_background = true
            vim.cmd.colorscheme("nord")
        end,
    },
    {
        "shaunsingh/moonlight.nvim",
        enabled = false,
        version = "*",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.moonlight_contrast = false
            vim.g.moonlight_disable_background = true
            vim.cmd.colorscheme("moonlight")
        end,
    },
    {
        "marko-cerovac/material.nvim",
        enabled = false,
        version = "*",
        -- lazy = false,
        priority = 1000,
        opts = {
            contrast = {
                lsp_virtual_text = true
            },
            disable = {
                -- background = true,
            },
        },
        config = function(_, opts)
            require("material").setup(opts)
            -- darker, lighter, oceanic, palenight, deep ocean
            vim.g.material_style = "palenight"
            vim.cmd.colorscheme("material")
        end,
    },
    {
        "sainnhe/gruvbox-material",
        -- enabled = false,
        version = "*",
        lazy = false,
        priority = 1000,
        config = function()
            -- Optionally configure and load the colorscheme
            -- directly inside the plugin declaration.
            -- hard, medium, soft
            vim.g.gruvbox_material_background = "soft"
            -- material, mix, original
            vim.g.gruvbox_material_foreground = "original"
            vim.g.gruvbox_material_enable_italic = true
            vim.g.gruvbox_material_transparent_background = 1
            vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
            -- default, mix, original
            vim.g.gruvbox_material_statusline_style = "original"
            vim.cmd.colorscheme("gruvbox-material")
        end,
    },
}
