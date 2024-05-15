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
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
Opt.rtp:prepend(lazypath)

require("settings")

require("lazy").setup("plugins", {})

require("neovide")
require("bindings")

Cmd.colorscheme("monokai-pro-classic")
