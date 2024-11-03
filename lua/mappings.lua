local wk = require "which-key"
--local function map(mode, lhs, rhs, opts)
--opts = opts or {}

local function map(lhs, rhs, opts)
  local keymap = {
    lhs = lhs,
    rhs = rhs,
    mode = opts and opts.mode or "n",
    desc = opts and opts.desc,
    group = opts and opts.group,
    hidden = opts and opts.hidden,
    proxy = opts and opts.proxy,
    expand = opts and opts.expand,
    icon = opts and opts.icon,
    name = opts and opts.name,
    remap = opts and opts.remap,
  }
  wk.add { keymap }
end

map("<C-b>", "<ESC>^i", { mode = "i", desc = "move beginning of line" })
map("<C-e>", "<End>", { mode = "i", desc = "move end of line" })
map("<C-h>", "<Left>", { mode = "i", desc = "move left" })
map("<C-l>", "<Right>", { mode = "i", desc = "move right" })
map("<C-j>", "<Down>", { mode = "i", desc = "move down" })
map("<C-k>", "<Up>", { mode = "i", desc = "move up" })

map("<C-h>", "<C-w>h", { desc = "switch window left" })
map("<C-l>", "<C-w>l", { desc = "switch window right" })
map("<C-j>", "<C-w>j", { desc = "switch window down" })
map("<C-k>", "<C-w>k", { desc = "switch window up" })

map("<Esc>", "<cmd>noh<CR>", { desc = "General Clear highlights" })

map("<leader>w", "<cmd>w<CR>", { desc = "General Save file" })
map("<C-c>", "<cmd>%y+<CR>", { desc = "General Copy whole file" })

-- UI
map("<leader>u", nil, { group = "UI", desc = "UI" })
map("<leader>ut", "<cmd>set nu!<CR>", { desc = "Toggle line number" })
map("<leader>ur", "<cmd>set rnu!<CR>", { desc = "Toggle relative number" })
map("<leader>uc", "<cmd>NvCheatsheet<CR>", { desc = "Toggle nvcheatsheet" })

-- global lsp mappings
map("<leader>l", nil, { group = "LSP", icon = {
  icon = "󱖫",
  color = "azure",
} })
map("<leader>ls", vim.diagnostic.setloclist, { desc = "LSP Diagnostic loclist" })
map("<leader>lf", function()
  require("conform").format { lsp_fallback = true }
end, { desc = "General Format file" })

-- tabufline

map("<leader>b", nil, { group = "buffer", name = "buffer" })
map("<leader>bb", "<cmd>enew<CR>", { desc = "buffer new" })

map("<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "buffer goto next" })

map("<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "buffer goto prev" })

map("<leader>bq", function()
  require("nvchad.tabufline").close_buffer()
end, { desc = "buffer close" })

-- Comment
map("<leader>/", "gcc", { desc = "Toggle Comment", remap = true })
map("<leader>/", "gc", { mode = "v", desc = "Toggle comment", remap = true })

-- nvimtree
map("<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })
map("<C-e>", "<cmd>NvimTreeFocus<CR>", { desc = "nvimtree focus window" })

-- telescope

map("<leader>f", nil, { group = "FIND" })
map("<leader>fw", "<cmd>Telescope live_grep<CR>", { desc = "telescope live grep" })
map("<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "telescope find buffers" })
map("<leader>fh", "<cmd>Telescope help_tags<CR>", { desc = "telescope help page" })
map("<leader>ma", "<cmd>Telescope marks<CR>", { desc = "telescope find marks" })
map("<leader>fo", "<cmd>Telescope oldfiles<CR>", { desc = "telescope find oldfiles" })
map("<leader>fz", "<cmd>Telescope current_buffer_fuzzy_find<CR>", { desc = "telescope find in current buffer" })
map("<leader>cm", "<cmd>Telescope git_commits<CR>", { desc = "telescope git commits" })
map("<leader>gt", "<cmd>Telescope git_status<CR>", { desc = "telescope git status" })
map("<leader>pt", "<cmd>Telescope terms<CR>", { desc = "telescope pick hidden term" })
map("<leader>th", "<cmd>Telescope themes<CR>", { desc = "telescope nvchad themes" })
map("<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "telescope find files" })
map(
  "<leader>fa",
  "<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>",
  { desc = "telescope find all files" }
)

-- GIT
map("<leader>g", nil, { group = "GIT", icon = {
  icon = "",
  color = "yellow",
} })
map("<leader>gl", "<cmd>LazyGit<cr>", { desc = "Git" })

-- terminal
map("<C-x>", "<C-\\><C-N>", { mode = "t", desc = "terminal escape terminal mode" })

-- new terminals
map("<leader>t", nil, { group = "Terminal", icon = {
  icon = "",
  color = "azure",
} })
map("<leader>th", function()
  require("nvchad.term").new { pos = "sp" }
end, { desc = "terminal new horizontal term" })

map("<leader>tv", function()
  require("nvchad.term").new { pos = "vsp" }
end, { desc = "terminal new vertical window" })

map("<leader>tf", function()
  require("nvchad.term").new { pos = "float" }
end, { desc = "terminal new float window" })

-- toggleable
map("<A-j>", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { mode = { "n", "t" }, desc = "terminal toggleable vertical term" })

map("<A-h>", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { mode = { "n", "t" }, desc = "terminal new horizontal term" })

map("<A-i>", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { mode = { "n", "t" }, desc = "terminal toggle floating term" })

-- whichkey
map("<leader>WK", "<cmd>WhichKey <CR>", { desc = "whichkey all keymaps" })

map("<leader>Wk", function()
  vim.cmd("WhichKey " .. vim.fn.input "WhichKey: ")
end, { desc = "whichkey query lookup" })

-- blankline
map("<leader>cc", function()
  local config = { scope = {} }
  config.scope.exclude = { language = {}, node_type = {} }
  config.scope.include = { node_type = {} }
  local node = require("ibl.scope").get(vim.api.nvim_get_current_buf(), config)

  if node then
    local start_row, _, end_row, _ = node:range()
    if start_row ~= end_row then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start_row + 1, 0 })
      vim.api.nvim_feedkeys("_", "n", true)
    end
  end
end, { desc = "blankline jump to current context" })

-- Plugins
map("<leader>p", nil, { group = "Plugins", icon = {
  icon = "",
  color = "azure",
} })
map("<leader>pl", "<cmd>Lazy<CR>", { desc = "Lazy" })
map("<leader>pm", "<cmd>Mason<CR>", { desc = "Mason" })
map("<leader>pi", "<cmd>MasonInstallAll <CR>", { desc = "Mason Install" })
map("<leader>pu", "<cmd>MasonUpdate <CR>", { desc = "Mason Update" })

map("<leader>Q", "<cmd> q <cr>", { desc = "close Neovim" })

map(";", ":", { desc = "CMD enter command mode" })
map("jk", "<ESC>", { mode = "i" })

map("<C-s>", "<cmd> w <cr>", { mode = { "n", "i", "v" } })

-- DAP
map("<Leader>d", "", { desc = "Debugger" })
map("<Leader>dl", "<cmd>lua require'dap'.step_into()<CR>", { desc = "Debugger step into" })
map("<Leader>dj", "<cmd>lua require'dap'.step_over()<CR>", { desc = "Debugger step over" })
map("<Leader>dk", "<cmd>lua require'dap'.step_out()<CR>", { desc = "Debugger step out" })
map("<Leader>d<space>", "<cmd>lua require'dap'.continue()<CR>", { desc = "Debugger continue" })
map("<Leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "Debugger toggle breakpoint" })
map(
  "<Leader>dd",
  "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
  { desc = "Debugger set conditional breakpoint" }
)
map("<Leader>de", "<cmd>lua require'dap'.terminate()<CR>", { desc = "Debugger reset" })
map("<Leader>dr", "<cmd>lua require'dap'.run_last()<CR>", { desc = "Debugger run last" })
