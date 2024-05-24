--[[
    File: plugins.lua
    Description: Plugin list
    See: https://github.com/salam99823/nvim-conf
]]
return {
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("plug.lualine"),
	},

	{
		"tanvirtin/monokai.nvim",
		opts = {},
	},

	{
		"loctvl842/monokai-pro.nvim",
		dependencies = {
			"MunifTanjim/nui.nvim",
		},
		opts = require("plug.monokai-pro"),
	},

	{
		"williamboman/mason.nvim",
		dependencies = {},
		opts = {
			ui = {
				border = "rounded",
			},
		},
	},

	{
		"williamboman/mason-lspconfig.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("plug.lspconf")
		end,
	},

	{
		"pest-parser/pest.vim",
		opts = {},
	},

	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup(require("plug.formatter"))
		end,
	},

	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"jay-babu/mason-nvim-dap.nvim",
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			{
				"jonboh/nvim-dap-rr",
				dependencies = {
					"nvim-dap",
					"telescope.nvim",
				},
			},
		},
		config = function()
			require("plug.dap")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		lazy = true,
		config = function()
			require("plug.lint")
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
				tag = "stable",
				opts = require("plug.crates"),
			},
		},
		config = function(plug)
			plug.setup(require("plug.cmp"))
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("plug.trouble"),
	},

	{
		"nvim-telescope/telescope.nvim",
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
		dependencies = {
			"nvim-lua/plenary.nvim",
			"MunifTanjim/nui.nvim",
		},
		opts = require("plug.neo-tree"),
	},

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
			{
				"windwp/nvim-ts-autotag",
				event = "InsertEnter",
				opts = {},
			},
			{
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				opts = {},
			},
		},
		event = {
			"BufReadPost",
			"BufNewFile",
		},
		opts = require("plug.treesitter"),
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
		config = function(plug)
			plug.setup(require("plug.neotest"))
		end,
	},

	{
		"folke/which-key.nvim",
		opts = {},
	},

	{
		"folke/neodev.nvim",
		opts = require("plug.neodev"),
	},

	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = require("plug.dashboard"),
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			enabled = false,
		},
	},

	{
		"akinsho/bufferline.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
	},

	{
		"akinsho/toggleterm.nvim",
		opts = require("plug.toggleterm"),
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {},
	},

	{
		"vxpm/ferris.nvim",
		opts = {
			create_commands = true,
			url_handler = "xdg-open",
		},
	},
}
