-- 高亮复制的文本
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.hl.on_yank()
    end,
})

-- 取消换行自动添加注释
vim.api.nvim_create_autocmd({"FileType"}, {
    command = "set formatoptions-=ro"
})
