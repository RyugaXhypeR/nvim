-- Chadrc overrides this file

local M = {}

M.options = {
  nvChad = {
    update_url = "https://github.com/RyugaXhypeR/nvim",
    update_branch = "master",
  },
}

M.ui = {
  -- hl = highlights
  hl_add = {
    LspInlayHint =  {fg = "#1f2f43"},
  },
  hl_override = {},
  changed_themes = {},
  theme = "solarized_dark",
  transparency = true,
}

M.plugins = {}

-- check core.mappings for table structure
M.mappings = require "core.mappings"

return M
