-- define common options

local opts = {
    silent = true,       -- do not show message
}

-----------------
-- Normal mode --
-----------------

vim.keymap.set("n", "x", '"_x')
vim.keymap.set("n", "s", '"_s')

-- Resize with arrows
-- delta: 2 lines
vim.keymap.set("n", "<A-Up>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<A-Down>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<A-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<A-Right>", ":vertical resize +2<CR>", opts)

-----------------
-- INSERT mode --
-----------------

vim.keymap.set("i", "jk", "<Esc>")

-----------------
-- Visual mode --
-----------------

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", opts)
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Hint: start visual mode with the same area as the previous area and the same mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-------------------
-- Terminal mode --
-------------------

-- Use <Esc> to exit terminal mode
vim.keymap.set("t", "<Esc>", "<C-\\><C-n>")

--------------
-- All mode --
--------------

-- vim.keymap.set({ "n", "i" }, "<C-z>", "<Cmd>undo<CR>", { silent = true })

-- Map <A-j>, <A-k>, <A-h>, <A-l> to navigate between windows in any modes
vim.keymap.set({ "t", "i" }, "<A-h>", "<C-\\><C-n><C-w>hi")
vim.keymap.set({ "t", "i" }, "<A-j>", "<C-\\><C-n><C-w>ji")
vim.keymap.set({ "t", "i" }, "<A-k>", "<C-\\><C-n><C-w>ki")
vim.keymap.set({ "t", "i" }, "<A-l>", "<C-\\><C-n><C-w>li")
vim.keymap.set({ "n" }, "<A-h>", "<C-w>h")
vim.keymap.set({ "n" }, "<A-j>", "<C-w>j")
vim.keymap.set({ "n" }, "<A-k>", "<C-w>k")
vim.keymap.set({ "n" }, "<A-l>", "<C-w>l")

vim.keymap.set({ "n", "i", "v", "t"}, "<A-->", "<Cmd>split<CR>")
vim.keymap.set({ "n", "i", "v", "t"}, "<A-\\>", "<Cmd>vsplit<CR>")
vim.keymap.set({ "n", "i", "v", "t"}, "<A-c>", "<Cmd>close<CR>")
