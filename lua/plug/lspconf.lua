--[[
    File: lspconf.lua
    Description: Mason-lspconfig plugin configuration
    See: https://github.com/williamboman/mason-lspconfig.nvim
]]
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")

local handlers = {
	-- The first entry (without a key) will be the default handler
	-- and will be called for each installed server that doesn't have
	-- a dedicated handler.
	function(server_name) -- default handler (optional)
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

mason_lspconfig.setup({
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
})

mason_lspconfig.setup_handlers(handlers)
