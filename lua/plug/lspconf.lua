--[[
    File: lspconf.lua
    Description: Mason-lspconfig plugin configuration
    See: https://github.com/williamboman/mason-lspconfig.nvim
]]
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local handlers = {
	function(server_name)
		lspconfig[server_name].setup({})
	end,
	["lua_ls"] = function()
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},
		})
	end,
}

return {
	handlers = handlers,
	ensure_installed = {
		"tsserver",
		"svelte",
		"emmet_ls",
		"cssls",
		"lua_ls",
		"ruff",
		"rust_analyzer",
		"clangd",
		"cmake",
		"lemminx",
		"biome",
		"taplo",
		"hydra_lsp",
		"vimls",
	},
}
