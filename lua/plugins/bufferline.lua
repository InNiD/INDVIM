return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    event = "VeryLazy",
    opts = {
        options = {
            diagnostics = "nvim_lsp",
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
              local s = " "
              for e, n in pairs(diagnostics_dict) do
                local sym = e == "error" and " "
                  or (e == "warning" and " " or " ")
                s = s .. n .. sym
              end
              return s
            end,
        },
    },
    config = function(_, opts)
        require("bufferline").setup(opts)
        vim.keymap.set({ "n", "i", "v", "t" }, "<C-h>", "<Cmd>BufferLineCyclePrev<CR>", { silent = true })
        vim.keymap.set({ "n", "i", "v", "t" }, "<C-l>", "<Cmd>BufferLineCycleNext<CR>", { silent = true })
        vim.keymap.set("n", "<leader>bw", ":bdelete<CR>", { silent = true })
        vim.keymap.set("n", "<leader>bo", ":BufferLineCloseOthers<CR>", { silent = true })
        vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>", { silent = true })
        vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>", { silent = true })
    end,
}
