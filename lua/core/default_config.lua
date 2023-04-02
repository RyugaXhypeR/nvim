-- Chadrc overrides this file

local M = {}

M.options = {
  nvChad = {
    update_url = "https://github.com/NvChad/NvChad",
    update_branch = "main",
    update_url = "https://github.com/RyugaXhypeR/nvim",
    update_branch = "master",
  },
}

M.ui = {
  -- hl = highlights
  hl_add = {},
  hl_add = {
    CocErrorSign = {fg = "#f07178"},
    CocInlayHint =  {fg = "#1f2f43"},
  },
  hl_override = {},
  changed_themes = {},
  theme_toggle = { "onedark", "one_light" },
  theme = "tokyonight", -- default theme
  transparency = false,
}

M.plugins = {}

-- check core.mappings for table structure
M.mappings = require "core.mappings"

return M
