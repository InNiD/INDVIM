return {
    "saghen/blink.cmp",
    dependencies = { "rafamadriz/friendly-snippets" },

    -- use a release tag to download pre-built binaries
    version = "*",

    event = { "InsertEnter", "CmdlineEnter" },
    opts = {
        -- "default" (recommended) for mappings similar to built-in completions (C-y to accept)
        -- "super-tab" for mappings similar to vscode (tab to accept)
        -- "enter" for enter to accept
        -- "none" for no mappings
        --
        -- All presets have the following mappings:
        -- C-space: Open menu or open docs if already open
        -- C-n/C-p or Up/Down: Select next/previous item
        -- C-e: Hide menu
        -- C-k: Toggle signature help (if signature.enabled = true)
        --
        -- See :h blink-cmp-config-keymap for defining your own keymap
        keymap = {
            preset = "default",
            -- ["<C-k>"] = { "select_prev", "fallback" },
            -- ["<C-j>"] = { "select_next", "fallback" },
            -- ["<C-u>"] = { "scroll_signature_up", "fallback" },
            -- ["<C-d>"] = { "scroll_signature_down", "fallback" },
            -- ['<C-s>'] = { 'show_signature', 'hide_signature', 'fallback' },
        },

        appearance = {
            -- "mono" (default) for "Nerd Font Mono" or "normal" for "Nerd Font"
            -- Adjusts spacing to ensure icons are aligned
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
                columns = {
                    { "label", "label_description", gap = 1 },
                    { "kind_icon", "kind" }
                },
                draw = { treesitter = { "lsp" }, },
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

        -- Default list of enabled providers defined so that you can extend it
        -- elsewhere in your config, without redefining it, due to `opts_extend`
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
        -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
        -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
        -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
        --
        -- See the fuzzy documentation for more information
        fuzzy = { implementation = "prefer_rust_with_warning" }
    },
    opts_extend = { "sources.default" },
}
