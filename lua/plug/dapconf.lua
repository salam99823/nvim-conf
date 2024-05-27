require("utils.binders")
local dap = require("dap")
Nm("<F5>", dap.terminate)
Nm("<F6>", dap.toggle_breakpoint)
Nm("<F7>", dap.continue)
Nm("<F8>", dap.step_over)
Nm("<F9>", dap.step_out)
Nm("<F10>", dap.step_into)
Nm("<F11>", dap.pause)
Nm("<F56>", dap.down)
Nm("<F57>", dap.up)
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
dap.configurations.rust = {
	rr_dap.get_rust_config(),
}
dap.configurations.cpp = {
	rr_dap.get_config(),
}
dap.configurations.python = {
	{
		type = "python",
		request = "launch",
		name = "Launch file",
		program = "${file}",
	},
}
local dapui = require("dapui")
dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
