-- Number Line
vim.wo.number = true
--  vim.wo.relativenumber=true

-- Setting Imports
print("Loading bootstrap")
require("config.bootstrap")
print("Loading options")
require("config.options")
print("Setting up lazy")
require("lazy").setup(require("config.plugins"))
print("Configuration loaded")

-- cycle_windows

local function is_valid_window(win)
    return win and vim.api.nvim_win_is_valid(win)
end

local function get_next_window(current_win)
    local wins = vim.api.nvim_list_wins()
    for i, win in ipairs(wins) do
        if win == current_win then
            return wins[i % #wins + 1]
        end
    end
    return wins[1]
end

local function focus_window(win)
    if is_valid_window(win) then
        vim.api.nvim_set_current_win(win)
    end
end

local function is_filetype(win, ft)
    if not is_valid_window(win) then return false end
    local buf = vim.api.nvim_win_get_buf(win)
    return vim.bo[buf].filetype == ft
end

local function toggle_neotree()
    vim.cmd("Neotree toggle")
end

local function toggle_terminal()
    vim.cmd("ToggleTerm")
end

function _G.cycle_windows()
    local current_win = vim.api.nvim_get_current_win()
    local next_win = get_next_window(current_win)

    if is_filetype(current_win, "neo-tree") then
        -- If we're in NeoTree, go to the next window
        focus_window(next_win)
    elseif is_filetype(current_win, "toggleterm") then
        -- If we're in ToggleTerm, go to the next window
        focus_window(next_win)
    else
        -- We're in a regular buffer
        if is_filetype(next_win, "neo-tree") then
            -- If NeoTree is next, focus on it
            focus_window(next_win)
        elseif is_filetype(next_win, "toggleterm") then
            -- If ToggleTerm is next, focus on it
            focus_window(next_win)
        else
            -- If neither NeoTree nor ToggleTerm is open, toggle NeoTree
            toggle_neotree()
        end
    end
end

-- Set up the keybinding
vim.api.nvim_set_keymap('n', '<C-Tab>', ':lua cycle_windows()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('i', '<C-Tab>', '<Esc>:lua cycle_windows()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<C-Tab>', '<C-\\><C-n>:lua cycle_windows()<CR>', {noremap = true, silent = true})
