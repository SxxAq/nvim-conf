-- File: lua/config/plugins/treesitter.lua
require("nvim-treesitter.configs").setup({
    ensure_installed = { "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
  })