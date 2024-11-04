local M = {}
local CPPDBG_BIN = vim.fn.stdpath "data" .. "/mason/bin/OpenDebugAD7"

M.adapter = {
  id = "cppdbg",
  type = "executable",
  command = CPPDBG_BIN,
  args = {},
}

M.config = {
  {
    name = "Launch",
    type = "cppdbg",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    -- program = '${fileDirname}/${fileBasenameNoExtension}',
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    runInTerminal = true,
    args = {},
  },
  {
    name = "Select and attach to process",
    type = "cppdbg",
    request = "attach",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    pid = function()
      local name = vim.fn.input "Executable name (filter): "
      return require("dap.utils").pick_process { filter = name }
    end,
    cwd = "${workspaceFolder}",
  },
  {
    name = "Attach to gdbserver :13000",
    type = "cppdbg",
    request = "attach",
    target = "localhost:13000",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    terminal = "integrated",
  },
}

return M
