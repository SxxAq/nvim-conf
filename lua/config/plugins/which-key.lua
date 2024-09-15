-- File: lua/config/plugins/which-key.lua

local wk = require("which-key")

wk.setup {
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and its label
        group = "+", -- symbol prepended to a group
    },
    window = {
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
    },
}

-- Register custom keybindings
wk.register({
    ["<C-a>"] = { "ggVG", "Select All" },
    ["<C-c>"] = { '"+y', "Copy" },
    ["<C-v>"] = { '"+p', "Paste" },
    ["<C-S-v>"] = { '"+p', "Paste" },
    ["<C-s>"] = { ":w<CR>", "Save" }, -- Save command in normal mode
}, { mode = "n" })

wk.register({
    ["<C-c>"] = { '"+y', "Copy" },
    ["<C-v>"] = { '"+p', "Paste" },
    ["<C-S-c>"] = { '"+y', "Copy" },
    ["<C-S-v>"] = { '"+p', "Paste" },
    ["<C-s>"] = { ":w<CR>", "Save" }, -- Save command in visual mode
}, { mode = "v" })

wk.register({
    ["<C-v>"] = { "<C-r>+", "Paste" },
    ["<C-s>"] = { "<Cmd>w<CR>", "Save" }, -- Save command in insert mode
}, { mode = "i" })

wk.register({
    ["<C-v>"] = { "<C-r>+", "Paste" },
    ["<C-s>"] = { "<Cmd>w<CR>", "Save" }, -- Save command in command-line mode
}, { mode = "c" })

