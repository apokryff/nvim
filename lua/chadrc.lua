-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua
-- Please read that file to know all available options :(
---@type ChadrcConfig
local M = {}

M.mason = {
  pkgs = {
    "stylua",
    "html-lsp",
    "css-lsp",
    "prettier",
    "ruff",
    "easy-coding-standard",
    "clang-format",
    "cpplint",
    "cpptools",
    "selene",
    "bash-debug-adapter",
    "shellcheck",
    "beautysh",
  },
}
M.nvdash = {
  load_on_startup = true,
  header = {
    " █████  ██████   ██████  ██   ██ ██████  ██    ██ ███████ ",
    "██   ██ ██   ██ ██    ██ ██  ██  ██   ██  ██  ██  ██      ",
    "███████ ██████  ██    ██ █████   ██████    ████   █████   ",
    "██   ██ ██      ██    ██ ██  ██  ██   ██    ██    ██      ",
    "██   ██ ██       ██████  ██   ██ ██   ██    ██    ██      ",
    "                                                          ",
  },

  buttons = {
    { txt = "  Start Working", keys = "Spc b", cmd = "enew" },
    { txt = "  Recent Files", keys = "Spc f o", cmd = "Telescope oldfiles" },
    { txt = "  Find File", keys = "Spc f f", cmd = "Telescope find_files" },
    { txt = "󰑑  Find Word", keys = "Spc f w", cmd = "Telescope live_grep" },
    { txt = "  Bookmarks", keys = "Spc b m", cmd = "Telescope marks" },
    { txt = "  Themes", keys = "Spc t h", cmd = "Telescope themes" },
    -- { txt = "  Mappings", keys = "Spc n m", cmd = "NvCheatsheet" },

    { txt = "─", hl = "NvDashLazy", no_gap = true, rep = true },

    {
      txt = function()
        local stats = require("lazy").stats()
        local ms = math.floor(stats.startuptime) .. " ms"
        return "  Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms
      end,
      hl = "NvDashLazy",
      no_gap = true,
    },
  },
}

M.base46 = {
  theme = "kanagawa",
  transparency = true,
  statusline = {
    theme = "vscode_colored",
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
