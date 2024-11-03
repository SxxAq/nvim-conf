-- Material theme colors
local colors = {
	black = "#1a1b26",
	white = "#c0caf5",
	red = "#f7768e",
	green = "#9ece6a",
	blue = "#7aa2f7",
	yellow = "#e0af68",
	purple = "#9d7cd8",
	cyan = "#7dcfff",
	gray = "#565f89",
}
local conditions = {
	buffer_not_empty = function()
		return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
	end,
	hide_in_width = function()
		return vim.fn.winwidth(0) > 80
	end,
}

local function diff_source()
	local gitsigns = vim.b.gitsigns_status_dict
	if gitsigns then
		return {
			added = gitsigns.added,
			modified = gitsigns.changed,
			removed = gitsigns.removed,
		}
	end
end

-- Compact mode name display
local mode_map = {
	["NORMAL"] = "N",
	["INSERT"] = "I",
	["VISUAL"] = "V",
	["V-LINE"] = "VL",
	["V-BLOCK"] = "VB",
	["COMMAND"] = "C",
	["TERMINAL"] = "T",
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "auto",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		globalstatus = true,
		refresh = {
			statusline = 1000,
			tabline = 1000,
			winbar = 1000,
		},
	},
	sections = {
		lualine_a = {
			{
				"mode",
				fmt = function(str)
					return mode_map[str] or str
				end,
			},
		},
		lualine_b = {
			{
				"branch",
				icon = "",
				color = { fg = colors.violet, gui = "bold" },
			},
			{
				"diff",
				source = diff_source,
				symbols = { added = " ", modified = " ", removed = " " },
				diff_color = {
					added = { fg = colors.green },
					modified = { fg = colors.yellow },
					removed = { fg = colors.red },
				},
				cond = conditions.hide_in_width,
			},
		},
		lualine_c = {
			{
				"filename",
				file_status = true,
				path = 1,
				shorting_target = 40,
				symbols = {
					modified = "[+]",
					readonly = "[-]",
					unnamed = "[No Name]",
				},
			},
		},
		lualine_x = {
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				diagnostics_color = {
					color_error = { fg = colors.red },
					color_warn = { fg = colors.yellow },
					color_info = { fg = colors.cyan },
				},
			},
			{ "filetype", colored = true, icon_only = true },
		},
		lualine_y = {
			{ "progress", color = { fg = colors.fg, gui = "bold" } },
		},
		lualine_z = {
			{ "location", color = { fg = colors.fg, gui = "bold" } },
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {},
		lualine_b = {
			{
				"buffers",
				show_filename_only = true,
				hide_filename_extension = false,
				show_modified_status = true,
				mode = 2, -- Use 2 for showing the modified status
				max_length = vim.o.columns * 2 / 3,
				buffers_color = {
					active = { fg = colors.blue, bg = colors.black, gui = "bold" },
					inactive = { fg = colors.gray, bg = colors.black },
				},
			},
		},
		lualine_c = {},
		lualine_x = {},
		lualine_y = {
			{
				"tabs",
				max_length = vim.o.columns / 3,
				tabs_color = {
					active = { fg = colors.blue, bg = colors.black, gui = "bold" },
					inactive = { fg = colors.gray, bg = colors.black },
				},
			},
		},
		lualine_z = {},
	},
	extensions = { "nvim-tree", "toggleterm" },
})
-- Keybindings
vim.api.nvim_set_keymap("n", "<Tab>", ":TablineBufferNext<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<S-Tab>", ":TablineBufferPrevious<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<Leader>tn", ":TablineTabNew ", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>tr", ":TablineTabRename ", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>tq", ":TablineBuffersClearBind<CR>", { noremap = true, silent = true })

-- Set required vim options
vim.cmd([[
  set guioptions-=e
  set sessionoptions+=tabpages,globals
]])
-- require("lualine").setup({
--   options = {
--     theme = "material",
--     component_separators = { left = "", right = "" },
--     section_separators = { left = "", right = "" },
--   },
--   sections = {
--     lualine_a = { "mode" },
--     lualine_b = { "branch", "diff", "diagnostics" },
--     lualine_c = { "filename" },
--     lualine_x = { "encoding", "fileformat", "filetype" },
--     lualine_y = { "progress" },
--     lualine_z = { "location" },
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { "filename" },
--     lualine_x = { "location" },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   tabline = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = { require("tabline").tabline_buffers },
--     lualine_x = { require("tabline").tabline_tabs },
--     lualine_y = {},
--     lualine_z = {},
--   },
--   extensions = {},
-- })
