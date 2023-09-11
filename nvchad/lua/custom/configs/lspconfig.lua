local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
-- local servers = { "html", "cssls", "tsserver", "clangd" }
--
-- for _, lsp in ipairs(servers) do
--   lspconfig[lsp].setup {
--     on_attach = on_attach,
--     capabilities = capabilities,
--   }
-- end
--
lspconfig.pyright.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    pyright = { autoImportCompletion = true },
    python = {
      -- https://github.com/microsoft/pyright/blob/main/docs/settings.md
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "openFilesOnly",
        useLibraryCodeForTypes = true,
        diagnosticSeverityOverrides = {
          -- reportGeneralTypeIssues = "none",
        --   reportOptionalMemberAccess = "none",
        --   reportOptionalSubscript = "none",
        --   reportPrivateImportUsage = "none",
        },
      },
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
