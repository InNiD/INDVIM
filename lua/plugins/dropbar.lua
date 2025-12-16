return {
    'Bekaboo/dropbar.nvim',
    enabled = false,
    version = "*",
    -- event = "VeryLazy",
    dependencies = {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'mingw32-make'
    },
    config = function(_, opts)
        local dropbar_api = require('dropbar.api')
        vim.keymap.set('n', '<Leader>dp', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
        vim.keymap.set('n', '<Leader>ds', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
        vim.keymap.set('n', '<Leader>dj', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
}
