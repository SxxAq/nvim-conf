-- File: lua/config/options.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


-- Set Gruvbox colorscheme
-- vim.cmd('colorscheme gruvbox')


-- Format keymap
vim.keymap.set("n", "<leader>I", vim.lsp.buf.format, {})


-- File: lua/config/windows_keymaps.lua

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = true }
    if opts then options = vim.tbl_extend('force', options, opts) end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- Copy (Ctrl+C)
map('v', '<C-c>', '"+y', { desc = "Copy to system clipboard" })
map('n', '<C-c>', '"+yy', { desc = "Copy line to system clipboard" })

-- Paste (Ctrl+V)
map('n', '<C-v>', '"+p', { desc = "Paste from system clipboard" })
map('v', '<C-v>', '"+p', { desc = "Paste from system clipboard" })
map('i', '<C-v>', '<C-r>+', { desc = "Paste from system clipboard" })
map('c', '<C-v>', '<C-r>+', { desc = "Paste from system clipboard in command mode" })

-- Cut (Ctrl+X)
map('v', '<C-x>', '"+d', { desc = "Cut to system clipboard" })
map('n', '<C-x>', '"+dd', { desc = "Cut line to system clipboard" })

-- Select All (Ctrl+A)
map('n', '<C-a>', 'ggVG', { desc = "Select all" })
map('i', '<C-a>', '<Esc>ggVG', { desc = "Select all" })

-- Save (Ctrl+S)
map('n', '<C-s>', ':w<CR>', { desc = "Save file" })
map('i', '<C-s>', '<Esc>:w<CR>', { desc = "Save file" })

-- Undo (Ctrl+Z)
map('n', '<C-z>', 'u', { desc = "Undo" })
map('i', '<C-z>', '<C-o>u', { desc = "Undo" })

-- Redo (Ctrl+Y)
map('n', '<C-y>', '<C-r>', { desc = "Redo" })
map('i', '<C-y>', '<C-o><C-r>', { desc = "Redo" })

-- New File (Ctrl+N)
map('n', '<C-n>', ':enew<CR>', { desc = "New file" })

-- Open File (Ctrl+O)
map('n', '<C-o>', ':browse confirm e<CR>', { desc = "Open file" })

-- Close File (Ctrl+W)
map('n', '<C-w>', ':confirm close<CR>', { desc = "Close file" })

-- Find (Ctrl+F)
map('n', '<C-f>', '/', { desc = "Find" })
map('i', '<C-f>', '<Esc>/', { desc = "Find" })

-- Replace (Ctrl+H)
map('n', '<C-h>', ':%s//g<Left><Left>', { desc = "Replace" })

-- Optional: Terminal support
map('t', '<C-v>', '<C-\\><C-n>"+pa', { desc = "Paste in terminal" })
map('t', '<C-c>', '<C-\\><C-n>"+yi', { desc = "Copy from terminal" })


