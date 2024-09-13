local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

-- Set header
dashboard.section.header.val = {
	"                                                     ",
	"  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
	"  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
	"  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
	"  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
	"  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
	"  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
	"                                                     ",
}

-- Set menu
dashboard.section.buttons.val = {
	dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("f", "  Find file", ":cd $HOME/ | Telescope find_files<CR>"),
	dashboard.button("r", "  Recent", ":Telescope oldfiles<CR>"),
	dashboard.button("s", "  Settings", ":e $MYVIMRC | :cd %:p:h | split . | wincmd k | pwd<CR>"),
	dashboard.button("q", "  Quit NVIM", ":qa<CR>"),
}

-- Set footer
dashboard.section.footer.val = {
	"The computing scientist's main challenge is not to",
	"get confused by the complexities of his own making.",
	"                               - Edsger W. Dijkstra",
}

-- Set custom highlight groups
local custom_colors = {
	bg = "#282828",
	fg = "#ebdbb2",
	yellow = "#fabd2f",
	cyan = "#8ec07c",
	green = "#b8bb26",
	orange = "#fe8019",
	purple = "#d3869b",
	red = "#fb4934",
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
