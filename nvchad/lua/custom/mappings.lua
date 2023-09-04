---@type MappingsTable
local M = {}

M.general = {
  n = {
    -- [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
  },
}

M.telescope = {
  plugin = true,

  n = {
    ["<leader>ds"] = { "<cmd> Telescope lsp_document_symbols <CR>", "[D]ocument [S]ymbols"},
    ["<leader>ws"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "[W]orkspace [S]ymbols"},
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "[G]oto [R]eferences"}
  },
}
-- more keybinds!

return M
