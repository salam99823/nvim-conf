local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

return {
	handlers = {
		function(server_name)
			lspconfig[server_name].setup({
				capabilities = capabilities,
			})
		end,
		["lua_ls"] = function()
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			})
		end,
	},
	ensure_installed = {
		"tsserver",
		"svelte",
		"emmet_ls",
		"cssls",
		"lua_ls",
		"pylsp",
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
