--[[
    File: toggleterm.lua
    Description: Configuration of toggleterm.nvim
    See: https://github.com/akinsho/toggleterm.nvim
]]
require("toggleterm").setup({
	open_mapping = "<c-\\>",
	close_on_exit = true, -- close the terminal window when the process exits
	-- Change the default shell. Can be a string or a function returning a string
	shell = vim.o.shell,
	auto_scroll = true,
})
