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
		"lua_ls", -- LSP for Lua language
		"tsserver", -- LSP for Typescript and Javascript
		"emmet_ls", -- LSP for Emmet (Vue, HTML, CSS)
		"cssls", -- LSP for CSS
		"ruff", -- LSP for Python
		"rust_analyzer", -- LSP for Rust
		"svelte", -- LSP for Svelte
	},
})

mason_lspconfig.setup_handlers(handlers)
