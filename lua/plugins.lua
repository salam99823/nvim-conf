return {
	"sainnhe/sonokai",
	{
		"nvim-lualine/lualine.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		lazy = false,
		keys = {
			{ "<leader>1", "<cmd>LualineBuffersJump 1<cr>" },
			{ "<leader>2", "<cmd>LualineBuffersJump 2<cr>" },
			{ "<leader>3", "<cmd>LualineBuffersJump 3<cr>" },
			{ "<leader>4", "<cmd>LualineBuffersJump 4<cr>" },
			{ "<leader>5", "<cmd>LualineBuffersJump 5<cr>" },
			{ "<leader>6", "<cmd>LualineBuffersJump 6<cr>" },
			{ "<leader>7", "<cmd>LualineBuffersJump 7<cr>" },
			{ "<leader>8", "<cmd>LualineBuffersJump 8<cr>" },
			{ "<leader>9", "<cmd>LualineBuffersJump 9<cr>" },
		},
		opts = {
			options = {
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				globalstatus = true,
			},
			sections = {
				lualine_b = { { "diagnostics", always_visible = true }, "filename" },
				lualine_c = {
					{
						require("lazy.status").updates,
						cond = require("lazy.status").has_updates,
					},
				},
				lualine_y = { "diff", "branch" },
			},
			tabline = {
				lualine_a = { { "buffers", use_mode_colors = false } },
				lualine_b = { { "tabs", mode = 1 } },
				lualine_z = { { "datetime", style = "%A, %d %B  %T" } },
			},
		},
	},
	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			{
				"zapling/mason-lock.nvim",
				init = function()
					require("mason-lock").setup({
						lockfile_path = vim.fn.stdpath("config") .. "/mason-lock.json",
					})
				end,
			},
		},
		opts = {
			ui = {
				border = "rounded",
				icons = {
					package_installed = "󰄳",
					package_pending = "󰇚",
					package_uninstalled = "󰝦",
				},
			},
		},
		config = function(_, opts)
			require("mason").setup(opts)
			require("mason-lspconfig").setup({
				handlers = {
					function(server_name)
						require("lspconfig")[server_name].setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
						})
					end,
					["lua_ls"] = function()
						require("lspconfig").lua_ls.setup({
							capabilities = require("cmp_nvim_lsp").default_capabilities(),
							settings = { Lua = { diagnostics = { globals = { "vim" } } } },
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
			})
		end,
	},

	{
		"stevearc/conform.nvim",
		event = { "BufWritePre" },
		cmd = { "ConformInfo" },
		keys = {
			{
				"<leader>f",
				function()
					require("conform").format({ async = true, lsp_fallback = true })
				end,
			},
		},
		opts = {
			formatters_by_ft = {
				lua = { "stylua" },
				python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				svelte = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier", "biome" } },
				css = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier", "markdownlint" } },
				yaml = { { "prettierd", "prettier" } },
				rust = { "rustfmt" },
				toml = { "taplo" },
				pest = { "pestfmt" },
			},
			format_on_save = { lsp_fallback = true },
			formatters = {
				pestfmt = {
					command = "pestfmt",
					args = { "--stdin" },
					stdin = true,
					inherit = true,
				},
				prettier = {},
			},
		},
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
			{ "vrslev/cmp-pypi", ft = "toml", dependencies = "nvim-lua/plenary.nvim" },
			{ "saecki/crates.nvim", ft = "toml", tag = "stable" },
		},
		config = function()
			require("cmp").setup({
				window = {
					border = "rounded",
					completion = require("cmp").config.window.bordered(),
					documentation = require("cmp").config.window.bordered(),
				},
				completion = { border = "rounded" },
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
				mapping = {
					["<Tab>"] = require("cmp").mapping.select_next_item(),
					["<S-Tab>"] = require("cmp").mapping.select_prev_item(),
					["<C-Space>"] = require("cmp").mapping.complete(),
					["<C-e>"] = require("cmp").mapping.close(),
					["<CR>"] = require("cmp").mapping.confirm({
						behavior = require("cmp").ConfirmBehavior.Replace,
						select = true,
					}),
				},
				sources = require("cmp").config.sources({
					{ name = "nvim_lsp" },
					{ name = "nvim_lsp_signature_help" },
					{ name = "cmp_tabnine" },
					{ name = "nvim_lua" },
					{ name = "luasnip" },
					{ name = "path" },
					{ name = "buffer" },
					{ name = "emoji" },
					{ name = "crates" },
					{ name = "pypi" },
					{ name = "nerdfont" },
				}),
			})
		end,
	},
	{
		"folke/trouble.nvim",
		dependencies = "nvim-tree/nvim-web-devicons",
		cmd = "Trouble",
		keys = {
			{ "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>" },
			{ "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>" },
			{ "<leader>cs", "<cmd>Trouble symbols toggle focus=false<cr>" },
			{ "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>" },
			{ "<leader>xL", "<cmd>Trouble loclist toggle<cr>" },
			{ "<leader>xQ", "<cmd>Trouble qflist toggle<cr>" },
		},
	},
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-fzy-native.nvim",
			"tsakirist/telescope-lazy.nvim",
			"benfowler/telescope-luasnip.nvim",
		},
		config = function()
			local telescope = require("telescope")
			telescope.setup({
				extensions = {
					lazy = {
						show_icon = true,
						terminal_opts = { border = "rounded" },
					},
					fzy_native = {
						override_generic_sorter = false,
						override_file_sorter = true,
					},
				},
				pickers = { oldfiles = { cwd_only = true } },
			})
			telescope.load_extension("lazy")
			telescope.load_extension("fzy_native")
			telescope.load_extension("luasnip")
		end,
	},
	{
		"nvim-neo-tree/neo-tree.nvim",
		dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
		cmd = "Neotree",
		keys = { { "<leader>v", "<cmd>Neotree filesystem left toggle dir=./<cr>" } },
		opts = {
			close_if_last_window = true,
			default_component_configs = {
				name = { trailing_slash = true, use_git_status_colors = true },
				indent = { with_markers = true, indent_size = 2 },
			},
			window = {
				width = 30,
				mappings = {
					["l"] = "open",
					["h"] = "close_node",
					["A"] = "git_add_all",
					["ga"] = "git_add_file",
					["gu"] = "git_unstage_file",
					["gr"] = "git_revert_file",
					["gc"] = "git_commit",
					["gp"] = "git_push",
					["gg"] = "git_commit_and_push",
				},
			},
			filesystem = {
				follow_current_file = { enabled = true },
				filtered_items = { visible = true },
			},
		},
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = { {
			"windwp/nvim-autopairs",
			event = "InsertEnter",
			config = true,
		} },
		main = "nvim-treesitter.configs",
		opts = {
			auto_install = true,
			ensure_installed = {
				"lua",
				"css",
				"scss",
				"html",
				"svelte",
				"typescript",
				"javascript",
				"vim",
				"vimdoc",
				"pymanifest",
				"python",
				"rust",
				"c",
				"cpp",
				"cmake",
				"git_config",
				"gitcommit",
				"gitignore",
				"markdown",
				"rst",
				"json",
				"toml",
				"yaml",
				"xml",
			},
			sync_install = false,
			highlight = { enable = true },
			indent = { enable = true },
		},
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
				adapters = { require("neotest-python"), require("neotest-rust") },
			})
		end,
	},
	"folke/which-key.nvim",
	{
		"folke/neodev.nvim",
		opts = {
			library = { enabled = true, runtime = true, types = true, plugins = true },
			setup_jsonls = true,
			lspconfig = true,
		},
	},
	{
		"nvimdev/dashboard-nvim",
		event = "VimEnter",
		dependencies = "nvim-tree/nvim-web-devicons",
		opts = {
			theme = "hyper",
			config = {
				week_header = { enable = true },
				shortcut = {
					{
						icon = " ",
						desc = "Files",
						action = "Telescope find_files",
						key = "f",
					},
					{
						icon = " ",
						desc = "Update",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						desc = "Find plugin documentation",
						action = "Telescope lazy",
						key = "d",
					},
				},
			},
		},
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = { enabled = false },
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
}
