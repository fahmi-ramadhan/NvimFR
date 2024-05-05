-- set leader key to space
vim.g.mapleader = " "

-- set clipboard options
vim.opt.clipboard = "unnamedplus"

-- set tab size to 4 space
vim.o.tabstop = 4
vim.o.expandtab = true
vim.o.softtabstop = 4
vim.o.shiftwidth = 4

-- set pwsh as default shell
vim.o.shell = "C:\\Users\\USER\\AppData\\Local\\Microsoft\\WindowsApps\\Microsoft.PowerShell_8wekyb3d8bbwe\\pwsh.exe"
vim.o.shellxquote = ""
vim.o.shellcmdflag = "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command "
vim.o.shellquote = ""
vim.o.shellpipe = "| Out-File -Encoding UTF8 %s"
vim.o.shellredir = "| Out-File -Encoding UTF8 %s"

-- set relative line number
vim.wo.relativenumber = true

-- line break
vim.opt.breakindent = true
vim.opt.formatoptions:remove "t"
vim.opt.linebreak = true

-- incremental search
vim.opt.incsearch = true

-- show minimal 10 lines at the bottom when scrolling, like padding
vim.opt.scrolloff = 10

-- misc
vim.opt.signcolumn = "yes"
vim.opt.isfname:append "@-@"
vim.opt.updatetime = 50

-- keymaps for switching windows
-- switch to the left
vim.keymap.set("n", "<C-h>", "<C-w>h", {})
-- switch to the right
vim.keymap.set("n", "<C-l>", "<C-w>l", {})
-- switch to the bottom
vim.keymap.set("n", "<C-j>", "<C-w>j", {})
-- switch to the top
vim.keymap.set("n", "<C-k>", "<C-w>k", {})

-- keymaps for indentation
vim.keymap.set("v", "<", "<gv", {})
vim.keymap.set("v", ">", ">gv", {})

-- escape terminal mode
vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))

-- line number
-- toggle lineNumber
vim.keymap.set("n", "<leader>n", "<cmd> set nu! <CR>")
-- toggle relativelinenumber
vim.keymap.set("n", "<leader>rn", "<cmd> set rnu! <CR>")

-- disable shift Q
vim.keymap.set("n", "Q", "<nop>")

-- biar text gak terlalu mepet ke bawah pas scroll
vim.keymap.set("n", "<C-d>", "<C-d>zz")

-- biar text gak terlalu mepet ke atas pas scroll
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "J", "mzJ`z")
