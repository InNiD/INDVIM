return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        keymap = {
            preset = "default",
            -- ["<C-k>"] = { "select_prev", "fallback" },
            -- ["<C-j>"] = { "select_next", "fallback" },
            -- ["<C-u>"] = { "scroll_signature_up", "fallback" },
            -- ["<C-d>"] = { "scroll_signature_down", "fallback" },
            -- ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },

        appearance = {
            nerd_font_variant = "mono"
        },

        completion = {
            accept = {
                auto_brackets = { enabled = true, },
            },
            documentation = {
                auto_show = true,
                auto_show_delay_ms = 500,
                window = {
                    border = "rounded",
                },
            },
            menu = {
                border = "rounded",
                draw = {
                    columns = {
                        { "label", "label_description", gap = 1 },
                        { "kind_icon", "kind", gap = 1 },
                    },
                    treesitter = { "lsp" },
                },
            },
            trigger = {
                show_on_backspace_in_keyword = true,
            },
        },

        signature = {
            enabled = true,
            window = {
                border = "single",
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer" },
        },

        cmdline = {
            sources = function()
                local cmd_type = vim.fn.getcmdtype()
                if cmd_type == "/" or cmd_type == "?" then
                    return { "buffer" }
                end
                if cmd_type == ":" or cmd_type == "@" then
                    return { "cmdline" }
                end
                return {}
            end,
            keymap = {
                preset = "default",
                -- ["<C-k>"] = { "select_prev", "fallback" },
                -- ["<C-j>"] = { "select_next", "fallback" },
            },
            completion = {
                menu = {
                    auto_show = true,
                },
            },
        },
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
}
