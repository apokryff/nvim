local dap = require "dap"
dap.set_log_level "DEBUG"
-- ui
require "configs.dap.ui"

-- debuggers
local cppdbg = require "configs.dap.adapters.cppdbg"
local bda = require "configs.dap.adapters.bda"
local pdb = require "configs.dap.adapters.pdb"
local pda = require "configs.dap.adapters.pda"

dap.adapters.cppdbg = cppdbg.adapter
dap.adapters.sh = bda.adapter
dap.adapters.python = pdb.adapter
dap.adapters.php = pda.adapter

dap.configurations.c = cppdbg.config
dap.configurations.cpp = cppdbg.config

dap.configurations.sh = bda.config
dap.configurations.python = pdb.config

dap.configurations.php = pda.config
