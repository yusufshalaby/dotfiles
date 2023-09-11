---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  theme = "tokyonight",
  theme_toggle = { "tokyonight", "doomchad" },
  telescope = { style = "bordered" }, -- borderless / bordered

  hl_override = highlights.override,
  hl_add = highlights.add,

  -- transparency = true,
  changed_themes = {
    all = {
      base_30 = {
  -- Controlling the color of the line numbers
        grey = "#7b7b7c",
      }
    }
  }
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

return M
