return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },
  {
    'Exafunction/codeium.vim',
    event = 'BufEnter'
  },
  {
    "https://github.com/lyokha/vim-xkbswitch",
    -- nothing here; do NOT require LSP
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
      "nvim-neotest/neotest-python",
    },
    config = function()
      require("neotest").setup({
        adapters = {
          require("neotest-python")({
            -- optional settings go HERE (not .setup)
          }),
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },
  {
    "m4xshen/hardtime.nvim",
    lazy = false,
    dependencies = { "MunifTanjim/nui.nvim" },
    opts = {},
  },
{
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" }, -- IMPORTANT
  config = function()
    require("nvim-treesitter.config").setup({
      ensure_installed = {
        "vim", "lua", "vimdoc",
        "html", "css", "python", "rust",
        "c",
      },
      highlight = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    })
  end,
},
  {
    "mbbill/undotree",
    lazy = false,  -- Force load the plugin
  },
}
