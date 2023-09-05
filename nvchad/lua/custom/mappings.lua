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
    ["<leader>ds"] = { "<cmd> Telescope lsp_document_symbols <CR>", "[D]ocument [S]ymbols" },
    ["<leader>ws"] = { "<cmd> Telescope lsp_dynamic_workspace_symbols <CR>", "[W]orkspace [S]ymbols" },
    ["<leader>cb"] = { "<cmd> Telescope git_bcommits <CR>", "Git [C]ommits [B]uffer" },
    ["<leader>gbr"] = { "<cmd> Telescope git_branches <CR>", "[G]it [BR]anches" },
    ["<leader>q"] = {" <cmd> Telescope diagnostics <CR>", "Diagnostics"},
    ["gr"] = { "<cmd> Telescope lsp_references <CR>", "[G]oto [R]eferences" },
  },
}

M.gitsigns = {
  plugin = true,

  n = {
    ["<leader>gbl"] = {
      function()
        package.loaded.gitsigns.blame_line()
      end,
      "[G]it [B]lame [L]ine",
    },
  },
}
-- more keybinds!

return M
