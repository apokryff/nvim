-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- LSP server
local servers = {
  "lua-language-server",
  "html",
  "cssls",
  "yamlls",
  "bashls",
  "jsonls",
  "dockerls",
  "ruff",
  "terraformls",
  "tflint",
  "ansiblels",
  "ts_ls",
  "emmet_ls",
  "intelephense",
  "clangd",
}
local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
-- lspconfig.tsserver.setup {
--   on_attach = nvlsp.on_attach,
--   on_init = nvlsp.on_init,
--   capabilities = nvlsp.capabilities,
-- }
