-- File: lua/config/plugins.lua
return {
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.8',
      branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
        require("config.plugins.telescope")
      end,
    },
    {
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function()
        require("config.plugins.treesitter")
      end,
    },
    {
      "nvim-neo-tree/neo-tree.nvim",
      branch = "v3.x",
      dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
      },
      config = function()
        require("config.plugins.neo-tree")
      end,
    },
    {
      "nvim-lualine/lualine.nvim",
      dependencies = { 'nvim-tree/nvim-web-devicons' },
      config = function()
        require("config.plugins.lualine")
      end,
    },
  }