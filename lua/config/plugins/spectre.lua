require("spectre").setup()

local keymap = vim.keymap.set

-- Open Spectre for global find/replace
keymap('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
    desc = "Toggle Spectre"
})

-- Search current word under cursor
keymap('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
    desc = "Search current word"
})

-- Search in current file
keymap('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
    desc = "Search in current file"
})

-- Search in visual selection
keymap('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
    desc = "Search current word"
})
