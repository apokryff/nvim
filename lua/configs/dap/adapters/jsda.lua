local M = {}

M.js_based_languages = { "javascript", "typescript" }

M.adapters = {
  {
    id = "pwa-node",
    type = "server",
    host = "localhost",
    port = 9229,
    command = "js-debug-adapter",
  },
  {
    id = "pwa-chrome",
    type = "server",
    host = "localhost",
    port = 9229,
    executable = {
      command = "js-debug-adapter",
      args = {
        "9229",
      },
    },
  },
}

M.config = {
  {
    type = "pwa-node",
    request = "attach",
    processId = require("dap.utils").pick_process,
    name = "Attach debugger to existing `node --inspect` process",
    sourceMaps = true,
    resolveSourceMapLocations = {
      "${workspaceFolder}/**",
      "!**/node_modules/**",
    },
    cwd = "${workspaceFolder}",
    skipFiles = { "${workspaceFolder}/node_modules/**/*.js" },
  },
  {
    type = "pwa-chrome",
    name = "Launch Chrome to debug client",
    request = "launch",
    url = function()
      return vim.fn.input("Enter the URL to debug: ", "http://localhost:3000")
    end,
    sourceMaps = true,
    protocol = "inspector",
    webRoot = "${workspaceFolder}",
    runtimeExecutable = "/usr/bin/vivaldi",
    skipFiles = { "**/node_modules/**/*", "<node_internals>/**", "**/webpack/**/*.js" },
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
