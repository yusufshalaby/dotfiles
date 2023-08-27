local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  -- b.formatting.deno_fmt, -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes

  -- Lua
  b.formatting.stylua,

  -- cpp
  -- b.formatting.clang_format,
  -- null_ls.builtins.diagnostics.mypy.with({
    -- extra_args = function()
    -- local virtual = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_DEFAULT_ENV") or "/usr"
  --   local handle = io.popen("which python")
  --   local pypath = handle:read("*a")
  --   handle:close()
  --   pypath = string.gsub(pypath, '%s+', '')
  --   return { "--python-executable", pypath }
  --   end,
  -- }),
  b.diagnostics.ruff,
  b.formatting.black,
  b.formatting.isort,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
