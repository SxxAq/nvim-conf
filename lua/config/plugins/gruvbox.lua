-- Set up Gruvbox with forced transparency
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.gruvbox_material_enable_italic = true

-- Load Gruvbox colorscheme
vim.cmd[[colorscheme tokyonight-storm]]
-- Function to force transparency
local function force_transparency()
	-- List of highlight groups to make transparent
	local groups = {
		"Normal",
		"NormalNC",
		"Comment",
		"Constant",
		"Special",
		"Identifier",
		"Statement",
		"PreProc",
		"Type",
		"Underlined",
		"Todo",
		"String",
		"Function",
		"Conditional",
		"Repeat",
		"Operator",
		"Structure",
		"LineNr",
		"NonText",
		"SignColumn",
		"CursorLineNr",
		"EndOfBuffer",
	}

	for _, group in ipairs(groups) do
		vim.cmd(string.format("hi %s guibg=NONE ctermbg=NONE", group))
	end
end

-- Call the function after the colorscheme is loaded
vim.cmd([[
    augroup TransparentBackground
        autocmd!
        autocmd ColorScheme * lua force_transparency()
    augroup END
]])

-- Force transparency immediately
force_transparency()
