local bufferline = require("bufferline")

bufferline.setup({
    options = {
        mode = "buffers", -- use "tabs" to display tabpages instead
        numbers = "none", -- no buffer numbers
        close_command = "bdelete! %d", -- close buffer command
        right_mouse_command = "bdelete! %d", -- right click closes buffer
        left_mouse_command = "buffer %d", -- left click switches buffer
        middle_mouse_command = nil, -- no middle mouse action
        -- Indicator icon on the active buffer (like in the image)
        indicator = {
            icon = '▎', -- vertical bar indicator for the active buffer
            style = 'icon',
        },
        -- Custom buffer close icon (use "✕" to mimic an "X" button)
        buffer_close_icon = '', -- "X" close button for individual buffers
        modified_icon = '●', -- show "●" for modified buffers
        close_icon = '', -- "X" icon on the far right to close all
        left_trunc_marker = '', -- icon when buffer names are truncated
        right_trunc_marker = '', -- icon when buffer names are truncated
        max_name_length = 18, -- buffer name length
        max_prefix_length = 15, -- buffer prefix length for duplicates
        tab_size = 18, -- tab size
        diagnostics = "nvim_lsp", -- show LSP diagnostics
        diagnostics_update_in_insert = false, -- update diagnostics in normal mode
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            -- Show diagnostic count on buffer
            return "("..count..")"
        end,
        -- Offset to integrate with NeoTree (or any other file explorer)
        offsets = {{
            filetype = "NeoTree", -- or "NvimTree"
            text = "File Explorer", -- file explorer label
            text_align = "left", -- align text to the left
        }},
        -- Show filetype icons on buffers
        show_buffer_icons = true, -- show icons like file types
        show_buffer_close_icons = true, -- show "X" close icon on buffers
        show_close_icon = false, -- disable global close icon on the right
        show_tab_indicators = true, -- show indicators for modified buffers
        persist_buffer_sort = true, -- keep buffer sort order
        -- Slanted separators between buffers to achieve a modern look
        separator_style = "slant", -- "slant" to match the image
        enforce_regular_tabs = false, -- allow irregular tab widths
        always_show_bufferline = true, -- always show the bufferline
    },
})

-- Keymaps for BufferLine
vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<CR>", { desc = "Toggle pin" })
vim.keymap.set("n", "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<CR>", { desc = "Delete non-pinned buffers" })
vim.keymap.set("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Previous buffer" })

