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



-- local function escape(str)
--   -- Escape characters that langmap requires
--   local escape_chars = [[;,."|\]]
--   return vim.fn.escape(str, escape_chars)
-- end
--
-- -- QWERTY (en)
-- local en = [[`qwertyuiop[]asdfghjkl;'zxcvbnm,./]]
-- -- Dvorak (dv)
-- local dv = [[`',.pyfgcrl/=[]aoeuidhtns-;qjkxbmwvz]]
--
-- -- Shifted versions
-- local en_shift = [[~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?]]
-- local dv_shift = [[~"<>PYFGCRL?+{}AOEUIDHTNS_:QJKXBMWVZ]]
--
-- vim.opt.langmap = vim.fn.join({
--   -- “to ; from” pairs (so Neovim thinks you’re typing en keys in Normal mode)
--   escape(dv_shift) .. ';' .. escape(en_shift),
--   escape(dv) .. ';' .. escape(en),
-- }, ',')
-- local original_layout = "us"
-- local original_variant = "intl"
-- local original_options = "grp:alt_shift_toggle,compose:rctrl"
--
-- local function set_layout(layout, variant, options)
--   local cmd = "setxkbmap " .. layout
--   if variant and variant ~= "" then
--     cmd = cmd .. " -variant " .. variant
--   end
--   if options and options ~= "" then
--     cmd = cmd .. " -option " .. options
--   end
--   -- Swap Left Ctrl and Left Alt keycodes: swap ctrl and alt modifiers
--   cmd = cmd .. " -option ctrl:swap_lalt_lctl"
--   vim.fn.system(cmd)
-- end
--
-- vim.api.nvim_create_autocmd("InsertEnter", {
--   callback = function()
--     set_layout("us", "dvorak", original_options)
--   end,
-- })
--
-- vim.api.nvim_create_autocmd("InsertLeave", {
--   callback = function()
--     set_layout(original_layout, original_variant, original_options)
--   end,
-- })
--
-- -- When you alt-tab away from Neovim, force dvorak layout
-- vim.api.nvim_create_autocmd("FocusLost", {
--   callback = function()
--     set_layout("us", "dvorak", original_options)
--   end,
-- })



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
  { 'wakatime/vim-wakatime', lazy = false },
{

  -- {
  --   "mfussenegger/nvim-jdtls",
  --   ft = { "java" },
  --   dependencies = { "williamboman/mason.nvim" },
  --   config = function()
  --     local jdtls = require("jdtls")
  --
  --     -- Find project root (wherever .git or build files are located)
  --     local root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" }
  --     local root_dir = require("jdtls.setup").find_root(root_markers)
  --
  --     if root_dir == "" then
  --       return
  --     end
  --
  --     local home = os.getenv("HOME")
  --     local workspace_dir = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")
  --
  --     local config = {
  --       cmd = {
  --         "java", -- must be on PATH
  --         "-Declipse.application=org.eclipse.jdt.ls.core.id1",
  --         "-Dosgi.bundles.defaultStartLevel=4",
  --         "-Declipse.product=org.eclipse.jdt.ls.core.product",
  --         "-Dlog.protocol=true",
  --         "-Dlog.level=ALL",
  --         "-Xmx1g",
  --         "--add-modules=ALL-SYSTEM",
  --         "--add-opens", "java.base/java.util=ALL-UNNAMED",
  --         "--add-opens", "java.base/java.lang=ALL-UNNAMED",
  --         "-jar", vim.fn.glob(home .. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
  --         "-configuration", home .. "/.local/share/nvim/mason/packages/jdtls/config_linux", -- change if mac/win
  --         "-data", workspace_dir,
  --       },
  --       root_dir = root_dir,
  --     }
  --
  --     jdtls.start_or_attach(config)
  --   end,
  -- },


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
-- {
--   'Wansmer/langmapper.nvim',
--   lazy = false,
--   priority = 1, -- High priority is needed if you will use `autoremap()`
--   config = function()
--     require('langmapper').setup({--[[ your config ]]})
--   end,
-- },

    {
      "ThePrimeagen/harpoon",
      config = function()
        require("harpoon").setup()
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
  }},
}, lazy_config)



dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"
require "autocmds"

vim.schedule(function()
  require "mappings"
end)

require("configs.harpoonOpen").setup()
