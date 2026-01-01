local opts = {
    silent = true,
}
--------------
-- All mode --
--------------

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ "n" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<A-l>", "<C-w>l")
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>hi")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>ji")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>ki")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>li")

-- 分屏和关闭分屏
vim.keymap.set({ "n", "i", "v", "t"}, "<A-->", "<Cmd>split<CR>")
vim.keymap.set({ "n", "i", "v", "t"}, "<A-\\>", "<Cmd>vsplit<CR>")
vim.keymap.set({ "n", "i", "v", "t"}, "<A-w>", "<Cmd>close<CR>")
vim.keymap.set({ "n", "i", "v", "t"}, "<A-o>", "<Cmd>only<CR>")

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set({ "n", "i", "v", "t"}, "<A-Up>", "<Cmd>resize +2<CR>", opts)
vim.keymap.set({ "n", "i", "v", "t"}, "<A-Down>", "<Cmd>resize -2<CR>", opts)
vim.keymap.set({ "n", "i", "v", "t"}, "<A-Left>", "<Cmd>vertical resize -2<CR>", opts)
vim.keymap.set({ "n", "i", "v", "t"}, "<A-Right>", "<Cmd>vertical resize +2<CR>", opts)

-----------------
-- Normal mode --
-----------------

-- 使用x或s删除文本时不将删除内容添加到剪切板
vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "s", '"_s')

-----------------
-- INSERT mode --
-----------------

vim.keymap.set("i", "jk", "<Esc>")

-----------------
-- Visual mode --
-----------------

-- 使用J和K移动选择的内容
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- 缩进后保持visual模式而不是变回normal模式
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-------------------
-- Terminal mode --
-------------------

-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

