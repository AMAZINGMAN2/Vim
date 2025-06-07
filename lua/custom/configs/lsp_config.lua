-- lsp_config.lua
local lspconfig = require("lspconfig")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Ensure Pyright is installed via Mason
mason.setup()
mason_lspconfig.setup({
  ensure_installed = { "pyright" },
})

-- LSP capabilities setup
local capabilities = cmp_nvim_lsp.default_capabilities()

-- Configure Pyright LSP server
mason_lspconfig.setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = capabilities,
    })
  end,
})
