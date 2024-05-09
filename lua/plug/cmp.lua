--[[
    File: cmp.lua
    Description: CMP plugin configuration (with lspconfig)
    See: https://github.com/hrsh7th/nvim-cmp
]]
require("utils.aliases")

local luasnip = require("luasnip")
local cmp = require("cmp")

cmp.setup({
	window = {
		border = "rounded",
	},
	completion = {
		border = "rounded",
	},

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
		{ name = "nvim_lsp" },
		{ name = "nvim_lsp_signature_help" },
		{ name = "nvim_lua" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "emoji" },
		{ name = "crates" },
	}),
})

-- Add snippets from Friendly Snippets
require("luasnip.loaders.from_vscode").lazy_load()
