--[[
    File: dap.lua
    Description: DAP plugin configuration
    See: https://github.com/mfussenegger/nvim-dap
]]
require("utils.aliases")
local dap = require("dap")

dap.adapters.gdb = {
	type = "executable",
	command = "gdb",
	args = { "-i", "dap" },
}

dap.configurations.c = {
	{
		name = "Launch",
		type = "gdb",
		request = "launch",
		program = function()
			return Fn.input("Path to executable: ", Fn.getcwd() .. "/", "file")
		end,
		cwd = "${workspaceFolder}",
		stopAtBeginningOfMainSubprogram = false,
	},
}