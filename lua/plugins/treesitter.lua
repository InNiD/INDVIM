return {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",

    config = function()
        local pattern = {
            "systemverilog", "markdown", "makrdonw_inline", "html", "latex", "c", "cpp", "python",
        }
        local filetype = { "verilog", "systemverilog", "markdown", "html", "c", "cpp", "python" }
        require('nvim-treesitter').install(pattern):wait(300000)
        vim.api.nvim_create_autocmd("FileType", {
            pattern = filetype,
            callback = function()
                vim.treesitter.start()
                -- vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                -- vim.wo.foldmethod = 'expr'
                -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
            end,
        })
    end,
}
