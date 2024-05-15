--[[
    File: plugins.lua
    Description: Plugin list
    See: https://github.com/salam99823/nvim-conf
]]
require("utils.aliases")

return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plug.lualine")
		end,
	},

	-- Colorscheme {{{
	{
		"tanvirtin/monokai.nvim",
		lazy = true,
		config = function()
			require("plug.monokai")
		end,
	},

	{
		"loctvl842/monokai-pro.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plug.monokai-pro")
		end,
	},
	-- }}}

	{
		"williamboman/mason.nvim",
		dependencies = {
			-- LSP {{{
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"pest-parser/pest.vim",
			-- }}}

			-- DAP {{{
			{
				"rcarriga/nvim-dap-ui",
				lazy = true,
				dependencies = {
					"mfussenegger/nvim-dap",
					"nvim-neotest/nvim-nio",
				},
				config = function()
					require("plug.dap")
				end,
			}, -- }}}

			-- Linter {{{
			{
				"mfussenegger/nvim-lint",
				lazy = true,
				config = function()
					require("plug.lint")
				end,
			},
			-- }}}

			-- Formatter {{{
			{
				"mhartington/formatter.nvim",
				config = function()
					require("plug.formatter")
				end,
			},
			-- }}}
		},
		config = function()
			require("plug.mason")
			require("plug.lspconf")
		end,
	},

	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"rafamadriz/friendly-snippets",
			"chrisgrieser/cmp-nerdfont",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-buffer",
			{
				"vrslev/cmp-pypi",
				dependencies = { "nvim-lua/plenary.nvim" },
				ft = "toml",
			},
			{
				"saecki/crates.nvim",
				ft = "toml",
				lazy = true,
				tag = "stable",
				config = function()
					require("plug.crates")
				end,
			},
		},
		config = function()
			require("plug.cmp")
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plug.trouble")
		end,
	},

	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-ui-select.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"nvim-telescope/telescope-dap.nvim",
			"tsakirist/telescope-lazy.nvim",
			"benfowler/telescope-luasnip.nvim",
		},
		config = function()
			require("plug.telescope")
		end,
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		config = function()
			require("plug.neo-tree")
		end,
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			"windwp/nvim-ts-autotag",
		},
		event = { "BufReadPost", "BufNewFile" },
		config = function()
			require("plug.treesitter")
		end,
	},

	{
		"nvim-neotest/neotest",
		lazy = true,
		dependencies = {
			"nvim-neotest/nvim-nio",
			"nvim-lua/plenary.nvim",
			"antoinemadec/FixCursorHold.nvim",
			"nvim-treesitter/nvim-treesitter",
			"nvim-neotest/neotest-python",
			"rouge8/neotest-rust",
		},
		config = function()
			require("plug.neotest")
		end,
	},

	{
		"folke/neodev.nvim",
		lazy = true,
		opts = {},
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("plug.dashboard")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {},
		config = function()
			require("plug.ibl")
		end,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("plug.bufferline")
		end,
	},

	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("plug.toggleterm")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	},
}
