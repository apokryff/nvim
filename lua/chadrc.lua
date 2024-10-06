-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(

---@type ChadrcConfig
local M = {}

M.mason = {
  pkgs = {
    "lua-language-server",
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "pyright",
    "ruff",
    "black",
    "isort",
    "easy-coding-standard",
  },
}
M.base46 = {
  theme = "kanagawa",
  transparency = true,
  statusline = {
    theme = "vscode_colored",
  },
  nvdash = {
    load_on_startup = true,
    header = {
      header = {},
    },
    buttons = {
      { "  Start Working", "", "enew" },
      { "  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰑑  Find Word", "Spc f w", "Telescope live_grep" },
      -- { "  Bookmarks", "Spc b m", "Telescope marks" },
      -- { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc n m", "NvCheatsheet" },
    },
  },

  hl_override = {
    Comment = { italic = true },
    ["@comment"] = { italic = true },
    DiffChange = {
      bg = "#464414",
      fg = "none",
    },
    DiffAdd = {
      bg = "#103507",
      fg = "none",
    },
    DiffRemoved = {
      bg = "#461414",
      fg = "none",
    },
  },
  -- hl_override = {
  -- 	Comment = { italic = true },
  -- 	["@comment"] = { italic = true },
  -- },
}

return M
