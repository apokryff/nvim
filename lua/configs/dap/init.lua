local dap = require "dap"

-- ui
require "configs.dap.ui"

-- debuggers
local ldb = require "configs.dap.adapters.codelldb"

dap.adapters.gdb = ldb.adapter

dap.configurations.c = ldb.config
dap.configurations.cpp = ldb.config
