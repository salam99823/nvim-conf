--[[
    File: cmp.lua
    Description: CMP plugin configuration (with lspconfig)
    See: https://github.com/hrsh7th/nvim-cmp
]]
require("utils.aliases")

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body) -- Luasnip expand
		end,
	},

	-- Mappings for cmp
	mapping = {
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
	},

	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- LSP
		{ name = "nvim_lsp_signature_help" }, -- LSP for parameters in functions
		{ name = "nvim_lua" }, -- Lua Neovim API
		{ name = "luasnip" }, -- Luasnip
		{ name = "buffer" }, -- Buffers
		{ name = "path" }, -- Paths
		{ name = "emoji" }, -- Emoji
	}),
})

-- Add snippets from Friendly Snippets
require("luasnip/loaders/from_vscode").lazy_load()
