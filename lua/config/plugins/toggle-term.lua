local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

toggleterm.setup({
	size = function(term)
		if term.direction == "horizontal" then
			return 15
		elseif term.direction == "vertical" then
			return vim.o.columns * 0.4
		end
	end,
	open_mapping = [[<c-`>]],
	hide_numbers = true,
	shade_terminals = true,
	start_in_insert = true,
	insert_mappings = true,
	persist_size = true,
	direction = "float",
	close_on_exit = true,
	shell = vim.o.shell,
	float_opts = {
		border = "curved",
		width = 120,
		height = 30,
		winblend = 3,
	},
})

function _G.set_terminal_keymaps()
	local opts = { buffer = 0 }
	vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
	vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
	vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
	vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
	vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local function create_toggle_term(direction)
	return function()
		local term = Terminal:new({ direction = direction })
		term:toggle()
	end
end

-- Define specific terminals
local bash = Terminal:new({ cmd = "bash", hidden = true })
local python = Terminal:new({ cmd = "python", hidden = true })
local htop = Terminal:new({ cmd = "htop", hidden = true })

function _G.toggle_terminal(name)
	if name == "bash" then
		bash:toggle()
	elseif name == "python" then
		python:toggle()
	elseif name == "htop" then
		htop:toggle()
	end
end

-- Function to cycle through terminals
function _G.cycle_terminals(direction)
    local terms = require("toggleterm").get_all()
    local term_count = #terms
    if term_count == 0 then
        return
    end
    local current_term = vim.g.toggleterm_current_term or 1
    if direction == "next" then
        current_term = current_term % term_count + 1
    elseif direction == "prev" then
        current_term = (current_term - 2 + term_count) % term_count + 1
    end
    vim.g.toggleterm_current_term = current_term
    terms[current_term]:toggle()
end
-- Keybindings for creating new terminals in different layouts
vim.api.nvim_set_keymap("n", "<leader>th", "", {
	noremap = true,
	silent = true,
	callback = create_toggle_term("horizontal"),
})
vim.api.nvim_set_keymap("n", "<leader>tv", "", {
	noremap = true,
	silent = true,
	callback = create_toggle_term("vertical"),
})
vim.api.nvim_set_keymap("n", "<leader>tf", "", {
	noremap = true,
	silent = true,
	callback = create_toggle_term("float"),
})

-- Keybindings for specific terminals
vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>lua toggle_terminal('bash')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua toggle_terminal('python')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tH", "<cmd>lua toggle_terminal('htop')<CR>", { noremap = true, silent = true })

-- Keybindings for multiple numbered terminals
for i = 1, 9 do
	vim.api.nvim_set_keymap("n", "<leader>" .. i, "<cmd>" .. i .. "ToggleTerm<CR>", { noremap = true, silent = true })
end

-- Keybinding for toggling all terminals
vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", { noremap = true, silent = true })

-- Keybindings for cycling through terminals
vim.api.nvim_set_keymap("n", "<leader>tn", ':lua cycle_terminals("next")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tN", ':lua cycle_terminals("prev")<CR>', { noremap = true, silent = true })
