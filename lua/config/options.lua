-- File: lua/config/options.lua
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")





-- Indentation shortcuts
vim.keymap.set('n', '<C-S-i>', '>>', { noremap = true, silent = true, desc = "Indent line" })
vim.keymap.set('n', '<C-S-I>', '<<', { noremap = true, silent = true, desc = "Unindent line" })
vim.keymap.set('v', '<C-S-i>', '>gv', { noremap = true, silent = true, desc = "Indent selection" })
vim.keymap.set('v', '<C-S-I>', '<gv', { noremap = true, silent = true, desc = "Unindent selection" })

