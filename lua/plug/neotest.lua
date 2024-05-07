--[[
    File: neotest.lua
    Description: neotest plugin configuration
    See: https://github.com/nvim-neotest/neotest
]]
local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-python")({
			-- Extra arguments for nvim-dap configuration
			-- See https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for values
			dap = { justMyCode = false },
			-- Command line arguments for runner
			-- Can also be a function to return dynamic values
			args = { "--log-level", "DEBUG" },
			-- Runner to use. Will use pytest if available by default.
			-- Can be a function to return dynamic value.
			runner = "unittests",
			-- Custom python path for the runner.
			-- Can be a string or a list of strings.
			-- Can also be a function to return dynamic value.
			-- If not provided, the path will be inferred by checking for
			-- virtual envs in the local directory and for Pipenev/Poetry configs
			python = ".venv/bin/python",
			-- !!EXPERIMENTAL!! Enable shelling out to `pytest` to discover test
			-- instances for files containing a parametrize mark (default: false)
			pytest_discover_instances = true,
		}),
    require("neotest-rust")
	},
})
