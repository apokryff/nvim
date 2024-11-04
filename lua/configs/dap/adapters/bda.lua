local M = {}

local BASH_DEBUG_DIR = "/home/apokryf/.local/share/nvim/mason/packages/bash-debug-adapter"
local BASH_DEBUG_ADAPTER_BIN = BASH_DEBUG_DIR .. "/bash-debug-adapter"
local BASHDB_DIR = BASH_DEBUG_DIR .. "/extension/bashdb_dir"

M.adapter = {
  id = "sh",
  type = "executable",
  command = BASH_DEBUG_ADAPTER_BIN,
}
M.config = {
  {
    name = "Launch Bash debugger",
    type = "sh",
    request = "launch",
    program = "${file}",
    cwd = "${fileDirname}",
    pathBashdb = BASHDB_DIR .. "/bashdb",
    pathBashdbLib = BASHDB_DIR,
    pathBash = "bash",
    pathCat = "cat",
    pathMkfifo = "mkfifo",
    pathPkill = "pkill",
    env = {},
    args = {},
    -- showDebugOutput = true,
    -- trace = true,
  },
}

return M
