return {
    "nvimdev/lspsaga.nvim",
    version = "*",
    event = "LspAttach",
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    },
    opts = {
        finder = {
            keys = {
                toggle_or_open = "<CR>",
            },
        },
        symbol_in_winbar = {
            enable = false,
        },
        outline = {
            close_after_jump = true,
            layout = 'float',
        },
    },
    keys = {
        { "<leader>lr", ":Lspsaga rename<CR>", silent = true },
        { "<leader>lc", ":Lspsaga code_action<CR>", silent = true },
        { "<leader>ld", ":Lspsaga definition<CR>", silent = true },
        { "<leader>lh", ":Lspsaga hover_doc<CR>", silent = true },
        { "<leader>li", ":Lspsaga finder<CR>", silent = true },
        { "<leader>ln", ":Lspsaga diagnostic_jump_next<CR>", silent = true },
        { "<leader>lp", ":Lspsaga diagnostic_jump_prev<CR>", silent = true },
        { "<leader>ls", ":Lspsaga show_line_diagnostics<CR>", silent = true },
        { "<leader>lo", ":Lspsaga outline<CR>", silent = true},
    },
}
