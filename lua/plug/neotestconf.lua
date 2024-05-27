return {
	log_level = vim.log.levels.INFO,
	floating = {
		border = "rounded",
		options = {},
		max_width = 60,
		max_height = 40,
	},
	status = {
		enabled = true,
		virtual_text = true,
		signs = false,
	},
	adapters = {
		require("neotest-python"),
		require("neotest-rust"),
	},
}
