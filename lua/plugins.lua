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
		opts = {
			background_clear = {
				"float_win",
				"toggleterm",
				"telescope",
				"neo-tree",
				"bufferline",
			},
			filter = "machine",
		},
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
		},
		opts = {
			ui = {
				border = "rounded",
			},
		},
		config = function(opts)
			require("mason").setup(opts)
			require("mason-lspconfig").setup(require("plug.lspconf"))
		end,
	},

	{
		"pest-parser/pest.vim",
		opts = {},
	},

	{
		"mhartington/formatter.nvim",
		config = function()
			require("formatter").setup({
				filetype = {
					lua = {
						require("formatter.filetypes.lua").stylua,
					},
					python = {
						require("formatter.filetypes.python").ruff,
					},
					rust = require("formatter.filetypes.rust"),
					markdown = {
						require("formatter.filetypes.markdown").prettier,
						require("formatter.filetypes.markdown").prettierd,
					},
					svelte = require("formatter.filetypes.svelte"),
					css = require("formatter.filetypes.css"),
					toml = require("formatter.filetypes.toml"),
					pest = {
						{
							exe = "pestfmt",
							args = {
								"--stdin",
							},
							stdin = true,
						},
					},
					yaml = require("formatter.filetypes.yaml"),
					["*"] = require("formatter.filetypes.any"),
				},
			})
		end,
	},

	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
			{
				"jonboh/nvim-dap-rr",
				dependencies = {
					"nvim-telescope/telescope.nvim",
				},
			},
		},
		opts = {
			ensure_installed = {
				"python",
				"codelldb",
				"cppdbg",
				"chrome",
			},
			handlers = {
				function(config)
					require("mason-nvim-dap").default_setup(config)
				end,
			},
		},
		config = function(opts)
			require("mason-nvim-dap").setup(opts)
			require("plug.dapconf")
		end,
	},

	{
		"mfussenegger/nvim-lint",
		lazy = true,
		config = function()
			require("lint").linters_by_ft = {
				markdown = {
					"markdownlint",
				},
				python = {
					"ruff",
					"mypy",
				},
			}
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
				opts = {},
			},
		},
		config = function()
			require("cmp").setup(require("plug.cmpconf"))
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {},
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
		config = function()
			require("neotest").setup({
				adapters = {
					require("neotest-python"),
					require("neotest-rust"),
				},
			})
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
		opts = {
			open_mapping = "<c-`>",
			close_on_exit = true,
			shell = vim.o.shell,
			auto_scroll = true,
		},
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
