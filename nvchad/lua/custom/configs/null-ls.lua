local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- chose deno for ts/js files bc its very fast!
  b.formatting.prettierd.with { filetypes = { "html", "markdown", "css", "json", "yaml" } },

  -- Lua
  b.formatting.stylua,

  -- cpp
  -- b.formatting.clang_format,
  b.diagnostics.ruff,
  b.formatting.black,
  b.formatting.isort,
  -- b.diagnostics.sqlfluff,
  -- b.formatting.sqlfluff,
}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/wiki/Formatting-on-save
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
  if client.supports_method "textDocument/formatting" then
    vim.api.nvim_clear_autocmds { group = augroup, buffer = bufnr }
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        -- on 0.8, you should use vim.lsp.buf.format({ bufnr = bufnr }) instead
        -- on later neovim version, you should use vim.lsp.buf.format({ async = false }) instead
        vim.lsp.buf.format { async = false }
      end,
    })
  end
end

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = on_attach,
}
