-- Set <space> as the leader key
vim.g.mapleader = " "
-- vim.g.maplocalleader = "\\"

-- Others
vim.api.nvim_create_autocmd("UIEnter", {
    callback = function()
        vim.opt.clipboard = "unnamedplus"
    end,
}) -- Sync clipboard between OS and Neovim. Schedule the setting after `UiEnter` because it can increase startup-time.
vim.opt.mouse = "a" -- allow the mouse to be used in nvim
vim.opt.scrolloff = 8 -- Minimal number of screen lines to keep above and below the cursor.
vim.opt.confirm = true -- if performing an operation that would fail due to unsaved changes in the buffer, instead raise a dialog asking if you wish to save the current file(s)
vim.opt.autoread = true
vim.opt.wrap = false
vim.opt.virtualedit = "block"

-- Tab
vim.opt.tabstop = 4 -- number of visual spaces per TAB
vim.opt.softtabstop = 4 -- number of spaces in tab when editing
vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
vim.opt.expandtab = true -- tabs are spaces, mainly because of Python
vim.opt.shiftround = true

-- UI config
vim.opt.title = true
vim.opt.number = true -- print the line number in front of each line
vim.opt.relativenumber = true -- use relative line numbers, so that it is easier to jump with j, k. This will affect the "number"
vim.opt.cursorline = true -- highlight the line where the cursor is on
-- vim.opt.colorcolumn = "80"
vim.opt.splitbelow = true -- open new vertical split bottom
vim.opt.splitright = true -- open new horizontal splits right
vim.opt.termguicolors = true -- enable 24-bit RGB color in the TUI
vim.opt.showmode = false -- don"t need the "-- INSERT --" mode hint
vim.opt.list = true -- Show <tab> and trailing spaces
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.winborder = "rounded"
-- vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 1

-- Searching
vim.opt.incsearch = true -- search as characters are entered
vim.opt.hlsearch = false -- do not highlight matches
vim.opt.ignorecase = true -- ignore case in searches by default
vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered

-- diagnostic
vim.diagnostic.config({
    signs = false,
    virtual_text = true,
    update_in_insert = true,
})

-- For nvim-tree & yazi
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- for verilog
vim.g.filetype_v = "verilog"

-- for powershell
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
