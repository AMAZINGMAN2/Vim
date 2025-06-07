vim.g.base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/"
vim.g.mapleader = " "
vim.o.termguicolors = true
vim.g.codeium_enabled = false
vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.spell = true
vim.o.spelllang = "en_nz"
vim.o.tabstop = 4
vim.o.shiftwidth = 4 
-- bootstrap lazy and all plugins
vim.g.loaded_netrw = 0
vim.g.loaded_netrwPlugin = 0
vim.g.codeium_os = "Linux"
vim.api.nvim_create_user_command("W", "w !sudo tee % > /dev/null", {})
-- bootstrap lazy and all plugins
vim.g.loaded_netrw = 0
vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        require('cmp').setup.buffer { enabled = true }
    end
})

vim.g.loaded_netrwPlugin = 0
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end
vim.opt.rtp:prepend(lazypath)
local lazy_config = require "configs.lazy"

-- Inside init.lua or appropriate file to load after plugins
-- require("custom.configs.lsp_config")
-- load plugins
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },
{
  "neovim/nvim-lspconfig",
},
{
  "williamboman/mason.nvim",
  build = ":MasonUpdate",
  config = function()
    require("mason").setup()
  end,
},
{
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/nvim-cmp",
  },
  config = function()
    require("mason-lspconfig").setup({
      ensure_installed = { "pyright" },
    })

    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    require("mason-lspconfig").setup_handlers({
      function(server_name)
        lspconfig[server_name].setup({
          capabilities = capabilities,
        })
      end
    })
  end,
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

dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
