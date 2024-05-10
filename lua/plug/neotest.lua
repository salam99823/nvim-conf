--[[
    File: neotest.lua
    Description: neotest plugin configuration
    See: https://github.com/nvim-neotest/neotest
]]
local neotest = require("neotest")

neotest.setup({
	adapters = {
		require("neotest-python")({
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
		}),
		require("neotest-rust"),
	},
})
