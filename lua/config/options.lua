-- File: lua/config/options.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Set options
vim.wo.number=true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"
vim.opt.backspace = "indent,eol,start"
vim.opt.clipboard:append("unnamedplus")
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.iskeyword:append("-")


-- vim.cmd[[highlight Normal guibg=NONE ctermbg=NONE]]
-- vim.cmd[[highlight NonText guibg=NONE ctermbg=NONE]]

-- Keymaps
vim.keymap.set("n", "<leader>I", vim.lsp.buf.format, { desc = "Format file" })

-- Windows-like keymaps
vim.keymap.set('v', '<C-c>', '"+y', { desc = "Copy to system clipboard" })
vim.keymap.set('n', '<C-c>', '"+yy', { desc = "Copy line to system clipboard" })
vim.keymap.set('n', '<C-v>', '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set('v', '<C-v>', '"+p', { desc = "Paste from system clipboard" })
vim.keymap.set('i', '<C-v>', '<C-r>+', { desc = "Paste from system clipboard" })
vim.keymap.set('c', '<C-v>', '<C-r>+', { desc = "Paste from system clipboard in command mode" })
vim.keymap.set('v', '<C-x>', '"+d', { desc = "Cut to system clipboard" })
vim.keymap.set('n', '<C-x>', '"+dd', { desc = "Cut line to system clipboard" })
vim.keymap.set('n', '<C-a>', 'ggVG', { desc = "Select all" })
vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { desc = "Select all" })
vim.keymap.set('n', '<C-s>', ':w<CR>', { desc = "Save file" })
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>', { desc = "Save file" })
vim.keymap.set('n', '<C-w>', ':confirm close<CR>', { desc = "Close file", noremap=true, silent=true })
