return {
    'nvim-telescope/telescope.nvim',
    tag = 'v0.2.0',
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = 'mingw32-make'
        },
        -- "nvim-telescope/telescope-ui-select.nvim",
    },
    cmd = "Telescope",
    opts = {
        defaults = {
            initial_mode = "insert",
            mappings = {
                i = {
                    -- ["<C-j>"] = "move_selection_next",
                    -- ["<C-k>"] = "move_selection_previous",
                    -- ["<C-n>"] = "cycle_history_next",
                    -- ["<C-p>"] = "cycle_history_prev",
                },
            },
        },
        extensions = {
            fzf = {
                fuzzy = true,
                override_generic_sorter = true,
                override_file_sorter = true,
                case_mode = "smart_case",
            },
            -- ["ui-select"] = {
            --     require("telescope.themes").get_dropdown {}
            -- },
        },
    },
    config = function(_, opts)
        local telescope = require "telescope"
        telescope.setup(opts)
        telescope.load_extension("fzf")
        -- telescope.load_extension("ui-select")
    end,
    keys = {
        { "<leader>ff", "<Cmd>Telescope find_files<CR>", desc = "find file", silent = true },
        { "<leader>fg", "<Cmd>Telescope live_grep<CR>", desc = "live grep", silent = true },
        { "<leader>fc", "<Cmd>Telescope git_commits<CR>", desc = "git commits", silent = true },
        { "<leader>fo", "<Cmd>Telescope oldfiles<CR>", desc = "find oldfiles", silent = true },
    },
}
