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