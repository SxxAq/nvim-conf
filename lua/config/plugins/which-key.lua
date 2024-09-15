local wk = require("which-key")

wk.setup {
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and its label
        group = "+", -- symbol prepended to a group
    },
    win = {  -- update from `window` to `win`
        border = "single", -- none, single, double, shadow
        position = "bottom", -- bottom, top
    },
}

-- Register custom keybindings

