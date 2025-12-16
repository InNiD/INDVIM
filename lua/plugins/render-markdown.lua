return {
    'MeanderingProgrammer/render-markdown.nvim',
    version = "*",
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ft = { 'markdown', },
    opts = {
        completions = { lsp = { enabled = true } },
    }
}
