local M = {}
local PHPDEBUG_ADAPTER_BIN = vim.fn.stdpath "data" .. "/mason/bin/php-debug-adapter"
print(PHPDEBUG_ADAPTER_BIN)
M.adapter = {
  id = "php",
  type = "executable",
  command = PHPDEBUG_ADAPTER_BIN,
  args = {
    -- PHPDEBUG_ADAPTER_BIN,
    -- "--listen",
    -- "localhost:5678",
    -- "--wait-for-client",
  },
  -- pythonPath = "/usr/bin/python",
}

M.config = {
  {
    name = "run current script",
    type = "php",
    request = "launch",
    port = 9000,
    cwd = "${fileDirname}",
    program = "${file}",
    runtimeExecutable = "php",
  },
  -- to listen to any php call
  {
    name = "listen for Xdebug local",
    type = "php",
    request = "launch",
    port = 9000,
  },
  -- to listen to php call in docker container
  {
    name = "listen for Xdebug docker",
    type = "php",
    request = "launch",
    port = 9000,
    -- this is where your file is in the container
    pathMappings = {
      ["/var/www/html"] = "${workspaceFolder}",
    },
  },
}
return M
