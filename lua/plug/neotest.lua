--[[
    File: neotest.lua
    Description: neotest plugin configuration
    See: https://github.com/nvim-neotest/neotest
]]
return {
	adapters = {
		require("neotest-python")({
			args = { "--log-level", "DEBUG" },
			runner = "pytest",
			python = ".venv/bin/python",
		}),
		require("neotest-rust"),
	},
}
