local toggleterm = require("toggleterm")

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
  direction = "horizontal",
  close_on_exit = true,
  shell = vim.o.shell,
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

-- Keybindings for creating new terminals in different layouts
vim.api.nvim_set_keymap("n", "<leader>th", ":ToggleTerm direction=horizontal<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tv", ":ToggleTerm direction=vertical<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tf", ":ToggleTerm direction=float<CR>", { noremap = true, silent = true })

-- Keybindings for multiple numbered terminals
for i = 1, 9 do
  vim.api.nvim_set_keymap("n", "<leader>" .. i, "<cmd>" .. i .. "ToggleTerm<CR>", { noremap = true, silent = true })
end

-- Keybinding for toggling all terminals
vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tb", "<cmd>lua toggle_terminal('bash')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua toggle_terminal('python')<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua toggle_terminal('htop')<CR>", { noremap = true, silent = true })

-- Keybindings for multiple numbered terminals
for i = 1, 9 do
  vim.api.nvim_set_keymap("n", "<leader>" .. i, "<cmd>" .. i .. "ToggleTerm<CR>", { noremap = true, silent = true })
end

-- Keybinding for toggling all terminals
vim.api.nvim_set_keymap("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", { noremap = true, silent = true })
