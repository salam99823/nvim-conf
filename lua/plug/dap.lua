--[[
    File: dap.lua
    Description: DAP plugin configuration
    See: https://github.com/mfussenegger/nvim-dap
]]
require("utils.aliases")

require("mason-nvim-dap").setup({
	ensure_installed = {
		"python",
		"codelldb",
		"cppdbg",
		"chrome",
	},
	handlers = {
		function(config)
			require("mason-nvim-dap").default_setup(config)
		end,
	},
})
local dap = require("dap")

local cpptools_path = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7"
dap.adapters.cppdbg = {
	id = "cppdbg",
	type = "executable",
	command = cpptools_path,
}

vim.keymap.set("n", "<F1>", dap.terminate)
vim.keymap.set("n", "<F6>", dap.toggle_breakpoint)
vim.keymap.set("n", "<F7>", dap.continue)
vim.keymap.set("n", "<F8>", dap.step_over)
vim.keymap.set("n", "<F9>", dap.step_out)
vim.keymap.set("n", "<F10>", dap.step_into)
vim.keymap.set("n", "<F11>", dap.pause)
vim.keymap.set("n", "<F56>", dap.down)
vim.keymap.set("n", "<F57>", dap.up)

local rr_dap = require("nvim-dap-rr")
rr_dap.setup({
	mappings = {
		continue = "<F7>",
		step_over = "<F8>",
		step_out = "<F9>",
		step_into = "<F10>",
		reverse_continue = "<F19>",
		reverse_step_over = "<F20>",
		reverse_step_out = "<F21>",
		reverse_step_into = "<F22>",
		step_over_i = "<F32>",
		step_out_i = "<F33>",
		step_into_i = "<F34>",
		reverse_step_over_i = "<F44>",
		reverse_step_out_i = "<F45>",
		reverse_step_into_i = "<F46>",
	},
})
dap.configurations.rust = { rr_dap.get_rust_config() }
dap.configurations.cpp = { rr_dap.get_config() }