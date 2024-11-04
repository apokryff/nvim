local dap = require "dap"
dap.set_log_level "TRACE"
-- ui
require "configs.dap.ui"

-- debuggers
local cppdbg = require "configs.dap.adapters.cppdbg"
local bda = require "configs.dap.adapters.bda"

dap.adapters.cppdbg = cppdbg.adapter
dap.adapters.sh = bda.adapter

dap.configurations.c = cppdbg.config
dap.configurations.cpp = cppdbg.config

dap.configurations.sh = bda.config
