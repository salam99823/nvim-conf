require("utils.aliases")
G.mapleader = " "
G.maplocalleader = "\\"

local lazypath = Fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	print("lazy is installing...")
	Fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end
Opt.rtp:prepend(lazypath)

require("settings")

require("lazy").setup({
	spec = require("plugins"),
	defaults = {
		lazy = false,
	},
	performance = {
		cache = {
			enabled = true,
		},
		reset_packpath = true,
		rtp = {
			reset = true,
			paths = {},
			disabled_plugins = {
				"gzip",
				"matchit",
				"matchparen",
				"netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"zipPlugin",
			},
		},
	},
	ui = {
		border = "rounded",
		pills = true,
	},
	checker = {
		enabled = false,
		notify = true,
	},
})

require("neovide")
require("bindings")

Cmd.colorscheme("monokai-pro")
