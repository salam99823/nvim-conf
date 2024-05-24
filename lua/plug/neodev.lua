--[[
  File: neodev.lua
  Description: Configuration of neodev
  See: https://github.com/folke/neodev.nvim
]]
return {
	library = {
		enabled = true,
		runtime = true,
		types = true,
		plugins = true,
	},
	setup_jsonls = true,
	lspconfig = true,
}
