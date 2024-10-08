local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
  "                                              ",
  "       ████ ██████           █████      ██",
  "      ███████████             █████ ",
  "      █████████ ███████████████████ ███   ███████████",
  "     █████████  ███    █████████████ █████ ██████████████",
  "    █████████ ██████████ █████████ █████ █████ ████ █████",
  "  ███████████ ███    ███ █████████ █████ █████ ████ █████",
  " ██████  █████████████████████ ████ █████ █████ ████ ██████",
}

-- Set menu
dashboard.section.buttons.val = {
    dashboard.button("n", "  New file", ":ene <BAR> startinsert <CR>"),
    dashboard.button("f", "  Find file", ":cd $HOME/ | Telescope find_files<CR>"),
    dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
    dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = {
    "Your work is going to fill a large part of your life,",
    "and the only way to be truly satisfied is to do what",
    "you believe is great work. And the only way to do",
    "great work is to love what you do.",
    "                               - Steve Jobs",
}

-- Set custom highlight groups
local custom_colors = {
    -- bg = "#eff1f5", -- Base color
    fg = "#4c4f69", -- Text color
    yellow = "#df8e1d",
    cyan = "#179299",
    green = "#40a02b",
    orange = "#fe640b",
    purple = "#8839ef",
    red = "#d20f39",
}

vim.api.nvim_set_hl(0, "AlphaHeader", { fg = custom_colors.yellow, bg = custom_colors.bg })
vim.api.nvim_set_hl(0, "AlphaButtons", { fg = custom_colors.orange, bg = custom_colors.bg })
vim.api.nvim_set_hl(0, "AlphaFooter", { fg = custom_colors.cyan, bg = custom_colors.bg })

-- Override dashboard colors
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaButtons"
dashboard.section.footer.opts.hl = "AlphaFooter"

-- Disable folding on alpha buffer
vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])

alpha.setup(dashboard.opts)
