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

-- Terminal keymaps
function _G.set_terminal_keymaps()
    local opts = {buffer = 0}
    vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
    vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
    vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
    vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
    vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal = require("toggleterm.terminal").Terminal

-- Custom terminal functions
local function create_toggle_term(direction)
    return function()
        local term = Terminal:new({ direction = direction })
        term:toggle()
    end
end

-- Keymaps for different layouts
vim.keymap.set("n", "<leader>th", create_toggle_term("horizontal"), {desc = "Horizontal terminal"})
vim.keymap.set("n", "<leader>tv", create_toggle_term("vertical"), {desc = "Vertical terminal"})
vim.keymap.set("n", "<leader>tf", create_toggle_term("float"), {desc = "Floating terminal"})

-- Specific terminals
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

-- Keymaps for specific terminals
vim.keymap.set("n", "<leader>tb", function() toggle_terminal('bash') end, {desc = "Bash terminal"})
vim.keymap.set("n", "<leader>tp", function() toggle_terminal('python') end, {desc = "Python terminal"})
vim.keymap.set("n", "<leader>tH", function() toggle_terminal('htop') end, {desc = "Htop terminal"})

-- Multiple numbered terminals
for i = 1, 9 do
    vim.keymap.set("n", "<leader>" .. i, "<cmd>" .. i .. "ToggleTerm<CR>", {desc = "Toggle terminal " .. i})
end

-- Toggle all terminals
vim.keymap.set("n", "<leader>ta", "<cmd>ToggleTermToggleAll<CR>", {desc = "Toggle all terminals"})
