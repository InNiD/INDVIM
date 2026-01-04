-- Others
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"
vim.opt.autoread = true
vim.opt.confirm = true
vim.opt.list = true -- Show <tab> and trailing spaces
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }
vim.opt.mouse = "a" -- allow the mouse to be used in nvim
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 16
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.wrap = false

-- Appear
vim.opt.cmdheight = 1
vim.opt.cursorline = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.showmode = false -- don't need the "-- INSERT --" mode hint
vim.opt.signcolumn = "yes"
vim.opt.title = true
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.opt.winborder = "rounded"
-- vim.opt.colorcolumn = "80"

-- Edit
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.opt.clipboard = "unnamedplus"
    end,
}) -- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can increase startup-time.
vim.diagnostic.config({
    signs = false,
    virtual_text = true,
    update_in_insert = true,
})
vim.opt.virtualedit = "block"

-- Search
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.incsearch = true -- search as characters are entered
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- Tab
vim.opt.expandtab = true -- tabs are spaces
vim.opt.shiftround = true
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.tabstop = 4 -- number of visual spaces per TAB

-- For nvim-tree & yazi
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- For powershell
local powershell_options = {
  shell = vim.fn.executable "pwsh" == 1 and "pwsh" or "powershell",
  shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;",
  shellredir = "-RedirectStandardOutput %s -NoNewWindow -Wait",
  shellpipe = "2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode",
  shellquote = "",
  shellxquote = "",
}
for option, value in pairs(powershell_options) do
  vim.opt[option] = value
end

-- For verilog
vim.g.filetype_v = "verilog"
