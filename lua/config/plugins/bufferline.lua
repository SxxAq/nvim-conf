-- Bufferline configuration
local bufferline = require("bufferline")

bufferline.setup({
	options = {
		mode = "buffers",
		style_preset = bufferline.style_preset.minimal,
		themable = true,
		numbers = "none",
		close_command = "bdelete! %d",
		right_mouse_command = "bdelete! %d",
		left_mouse_command = "buffer %d",
		middle_mouse_command = nil,
		indicator = {
			icon = " ",
			style = "icon",
		},
		buffer_close_icon = "", -- Smaller close icon
		modified_icon = "●",
		close_icon = "", -- Smaller close icon
		left_trunc_marker = "", -- Better left separator
		right_trunc_marker = "", -- Better right separator
		max_name_length = 18,
		max_prefix_length = 15,
		tab_size = 13,
		diagnostics = "nvim_lsp",
		diagnostics_update_in_insert = false,
		diagnostics_indicator = function(count, level, diagnostics_dict, context)
			return "(" .. count .. ")"
		end,
		offsets = {
			{
				filetype = "NvimTree",
				text = "File Explorer",
				text_align = "left",
			},
		},
		color_icons = true,
		show_buffer_icons = true,
		show_buffer_close_icons = true,
		show_close_icon = false,
		show_tab_indicators = true,
		persist_buffer_sort = true,
		separator_style = "thin",
		enforce_regular_tabs = true,
		always_show_bufferline = true,
		hover = {
			enabled = true,
			delay = 200,
			reveal = { "close" },
		},
		sort_by = "id",
	},
	highlights = {
		fill = {
			fg = "#ebdbb2",
			bg = "#3c3836",
		},
		background = {
			fg = "#ebdbb2",
			bg = "#3c3836",
		},
		buffer_visible = {
			fg = "#ebdbb2",
			bg = "#3c3836",
		},
		buffer_selected = {
			fg = "#ebdbb2",
			bg = "#504945",
			bold = true,
			italic = false,
		},
		indicator_selected = {
			fg = "#b8bb26",
			bg = "#504945",
		},
		modified = {
			fg = "#fb4934",
			bg = "#3c3836",
		},
		modified_visible = {
			fg = "#fb4934",
			bg = "#3c3836",
		},
		modified_selected = {
			fg = "#fb4934",
			bg = "#504945",
		},
		duplicate_selected = {
			fg = "#ebdbb2",
			bg = "#504945",
			italic = true,
		},
		duplicate_visible = {
			fg = "#ebdbb2",
			bg = "#3c3836",
			italic = true,
		},
		duplicate = {
			fg = "#ebdbb2",
			bg = "#3c3836",
			italic = true,
		},
		separator_selected = {
			fg = "#282828",
			bg = "#504945",
		},
		separator_visible = {
			fg = "#282828",
			bg = "#3c3836",
		},
		separator = {
			fg = "#282828",
			bg = "#3c3836",
		},
		offset_separator = {
			fg = "#282828",
			bg = "#3c3836",
		},
		close_button = {
			fg = "#ebdbb2",
			bg = "#3c3836",
		},
		close_button_visible = {
			fg = "#ebdbb2",
			bg = "#3c3836",
		},
		close_button_selected = {
			fg = "#ebdbb2",
			bg = "#504945",
		},
		tab = {
			fg = "#a89984",
			bg = "#3c3836",
		},
		tab_selected = {
			fg = "#ebdbb2",
			bg = "#504945",
			bold = true,
		},
		tab_close = {
			fg = "#a89984",
			bg = "#3c3836",
		},
	},
})

-- Keymaps
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })
