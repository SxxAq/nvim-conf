-- config/plugins/which-key.lua
local wk = require("which-key")

wk.setup {}

-- Register custom keybindings
wk.register({
  ["<C-a>"] = { "ggVG", "Select All" },
  ["<C-c>"] = { '"+y', "Copy", mode = { "n", "v" } },
  ["<C-v>"] = { '"+p', "Paste", mode = "n" },
  ["<C-v>"] = { '<C-r>+', "Paste", mode = "i" },
  ["<C-v>"] = { '<C-r>+', "Paste", mode = "c" },
  ["<C-S-c>"] = { '"+y', "Copy in Visual Mode", mode = "v" },
  ["<C-S-v>"] = { '"+p', "Paste", mode = "n" },
  ["<C-S-v>"] = { '"+p', "Paste", mode = "v" },
}, { mode = "n" })

wk.register({
  ["<C-c>"] = { '"+y', "Copy" },
  ["<C-v>"] = { '"+p', "Paste" },
  ["<C-S-c>"] = { '"+y', "Copy" },
  ["<C-S-v>"] = { '"+p', "Paste" },
}, { mode = "v" })

wk.register({
  ["<C-v>"] = { '<C-r>+', "Paste" },
}, { mode = "i" })

wk.register({
  ["<C-v>"] = { '<C-r>+', "Paste" },
}, { mode = "c" })

