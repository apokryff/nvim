local M = {}
local DEBUGPY_ADAPTER_BIN = vim.fn.stdpath "data" .. "/mason/bin/debugpy-adapter"

M.adapter = {
  id = "python",
  type = "executable",
  command = DEBUGPY_ADAPTER_BIN,
  args = {
    -- "--listen",
    -- "localhost:5678",
    -- "--wait-for-client",
  },
  -- pythonPath = "/usr/bin/python",
}

M.config = {
  {
    name = "Launch",
    type = "python",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    -- program = '${fileDirname}/${fileBasenameNoExtension}',
    cwd = "${workspaceFolder}",
    stopOnEntry = true,
    runInTerminal = true,
    args = {},
    console = "integratedTerminal",
  },

  -- {
  --   name = "Attach to pythondb :5678",
  --   type = "python",
  --   request = "attach",
  --   target = "localhost:5678",
  --   connect = function()
  --     local host = vim.fn.input "Host [127.0.0.1]: "
  --     host = host ~= "" and host or "localhost"
  --     local port = tonumber(vim.fn.input "Port [5678]: ") or 5678
  --     return { host = host, port = port }
  --   end,
  --   cwd = "${workspaceFolder}",
  --   -- terminal = "integrated",
  --   stopOnEntry = false,
  --   runInTerminal = true,
  --   args = {},
  --   console = "integratedTerminal",
  -- },
}

return M
