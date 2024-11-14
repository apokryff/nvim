local M = {}

M.js_based_languages = { "javascript", "typescript" }
M.adapters = {
  {
    id = "pwa-node",
    type = "server",
    host = "localhost",
    port = 3000,
    command = "js-debug-adapter",
  },
  {
    id = "pwa-chrome",
    type = "server",
    host = "localhost",
    port = 3000,
    command = "chrome-debug-adapter",
  },
}

M.config = {
  {
    type = "pwa-node",
    request = "launch",
    name = "Launch file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-node",
    request = "attach",
    name = "Attach",
    processId = require("dap.utils").pick_process,
    cwd = "${workspaceFolder}",
  },
  {
    type = "pwa-chrome",
    request = "launch",
    name = 'Start Chrome with "localhost"',
    url = "localhost:9229",
    webRoot = "${workspaceFolder}",
    -- userDataDir = "${workspaceFolder}/.vscode/vscode-chrome-debug-userdatadir",
  },
}

function M.setup_adapters(dap)
  for _, adapter in ipairs(M.adapters) do
    dap.adapters[adapter.id] = adapter
  end
end

function M.setup_configurations(dap)
  for _, language in ipairs(M.js_based_languages) do
    dap.configurations[language] = M.config
  end
end

function M.setup(dap)
  M.setup_adapters(dap)
  M.setup_configurations(dap)
end

return M
