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
				check_outdated_packages_on_open = true,
				border = "rounded",
				width = 0.8,
				height = 0.9,
				icons = {
					package_installed = "󰄳",
					package_pending = "󰇚",
					package_uninstalled = "󰝦",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			require("mason-lspconfig").setup(require("plug.lspconf"))
		end,
	},

	{
		"pest-parser/pest.vim",
		ft = "pest",
		opts = {},
	},

	{
		"mhartington/formatter.nvim",
		cmd = {
			"Format",
			"FormatWrite",
		},
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
					json = require("formatter.filetypes.json").biome,
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
		config = function(_, opts)
			require("mason-nvim-dap").setup(opts)
			require("dapui").setup()
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
			Api.nvim_create_user_command("TryLint", function(args)
				require("lint").try_lint(args.fargs[0])
			end, {
				nargs = 1,
				complete = function(_, _, _)
					local filetype = Api.nvim_buf_get_option(0, "filetype")
					return require("lint").linters_by_ft[filetype]
				end,
				desc = "",
			})
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
			local telescope = require("telescope")
			telescope.setup(require("plug.telescopeconf"))
			telescope.load_extension("ui-select")
			telescope.load_extension("lazy")
			telescope.load_extension("dap")
			telescope.load_extension("fzy_native")
			telescope.load_extension("luasnip")
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
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				opts = {},
			},
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
			require("neotest").setup(require("plug.neotestconf"))
		end,
	},

	{
		"folke/which-key.nvim",
		opts = {},
	},

	{
		"folke/neodev.nvim",
		opts = {
			library = {
				enabled = true,
				runtime = true,
				types = true,
				plugins = true,
			},
			setup_jsonls = true,
			lspconfig = true,
		},
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
		ft = "rust",
		opts = {
			create_commands = true,
			url_handler = "xdg-open",
		},
	},
}
