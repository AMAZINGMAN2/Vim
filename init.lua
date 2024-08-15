vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.spell = true
vim.o.spelllang = "en_nz"
-- bootstrap lazy and all plugins
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
vim.env.PYTHONPATH = 'E:\\Python\\Packages;' .. (vim.env.PYTHONPATH or '')
vim.env.PATH = 'C:\\Documents\\pipEnviroment\venv;' .. (vim.env.PATH or '')
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)
local lazy_config = require "configs.lazy"

-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
  'tpope/vim-commentary',
  'mhartington/formatter.nvim',
  { import = "plugins" },

  -- Add NvimTree
  {
    'kyazdani42/nvim-tree.lua',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require'nvim-tree'.setup {}
    end,
  },

  -- Add Harpoon
  {
    "ThePrimeagen/harpoon",
    config = function()
      require("harpoon").setup({
        global_settings = {
          save_on_toggle = true,
          save_on_change = true,
          enter_on_sendcmd = false,
          tmux_autoclose_windows = false,
          excluded_filetypes = { "harpoon" },
          mark_branch = false,
        },
        menu = {
          width = vim.api.nvim_win_get_width(0) - 4,
          height = vim.api.nvim_win_get_height(0) - 4,
          borderchars = {
            "─", "│", "─", "│", "╭", "╮", "╯", "╰",
          },
        }
      })
    end,
  },

  -- Add Telescope.nvim
  {
    "nvim-telescope/telescope.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-harpoon.nvim"
    },
    config = function()
      require('telescope').setup {
        defaults = {
          file_ignore_patterns = {"node_modules", ".git"},
          mappings = {
            i = {
              ["<C-u>"] = false,
              ["<C-d>"] = false,
            },
          },
        },
        pickers = {
          find_files = {
            theme = "dropdown",
          },
          live_grep = {
            theme = "dropdown",
          },
        },
        extensions = {
          harpoon = {}
        }
      }
      require('telescope').load_extension('harpoon')
    end
  },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
