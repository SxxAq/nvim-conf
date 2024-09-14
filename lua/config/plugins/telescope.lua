-- File: lua/config/plugins/telescope.lua
local telescope = require("telescope")
local actions = require('telescope.actions')
telescope.setup({
	-- You can add any Telescope configuration here
	defaults = {
		mappings = {
			i = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
			},
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
})

-- To get ui-select loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
-- Keybinding for Telescope live grep
vim.keymap.set("n", "<leader>fg", function()
	require("telescope.builtin").live_grep()
end, { desc = "Find in Files (Grep)" })

-- Keybinding for Telescope find files
vim.keymap.set("n", "<leader>ff", function()
	require("telescope.builtin").find_files()
end, { desc = "Find Files" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
vim.keymap.set("n", "<C-p>", builtin.find_files, {})
