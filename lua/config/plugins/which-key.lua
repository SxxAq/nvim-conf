local wk = require("which-key")
wk.setup({
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
    presets = {
      operators = false,
      motions = false,
      text_objects = false,
      windows = true,
      nav = true,
      z = true,
      g = true,
    },
  },
  icons = {
    breadcrumb = "»",
    separator = "➜",
    group = "+",
  },
  popup_mappings = {
    scroll_down = '<c-d>',
    scroll_up = '<c-u>',
  },
  window = {
    border = "single",
    position = "bottom",
    margin = { 1, 0, 1, 0 },
    padding = { 2, 2, 2, 2 },
    winblend = 0
  },
  layout = {
    height = { min = 4, max = 25 },
    width = { min = 20, max = 50 },
    spacing = 3,
    align = "left",
  },
  ignore_missing = true,
  show_help = false,
  triggers = { "<leader>" },
  triggers_nowait = {},
  triggers_blacklist = {
    i = { "j", "k" },
    v = { "j", "k" },
  },
  key_labels = {
    ["<space>"] = "SPC",
    ["<cr>"] = "RET",
    ["<tab>"] = "TAB",
  },
  disable = {
    buftypes = {},
    filetypes = {},
  },
})



vim.api.nvim_create_augroup("WhichKeyGroup", { clear = true })

-- Optional: If you want to manually trigger which-key
vim.keymap.set("n", "<leader>wk", function()
  wk.show()
end, { desc = "Show Which-Key" })

-- Resolve conflicting keymaps
vim.keymap.set("n", "<leader>w", "<cmd>confirm close<CR>", { desc = "Close buffer", noremap = true })
vim.keymap.set("n", "<leader>W", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbol" })
vim.keymap.set("n", "gc", "<Plug>(comment_toggle_linewise)", { desc = "Toggle comment linewise" })
vim.keymap.set("n", "gb", "<Plug>(comment_toggle_blockwise)", { desc = "Toggle comment blockwise" })
