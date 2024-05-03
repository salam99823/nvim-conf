--[[
  File: settings.lua
  Description: Base settings for neovim
]]

require "utils/aliases"

-- Set association between turned on plugins and filetype
cmd[[filetype plugin on]]

-- Set association between indent side and filetype
cmd[[filetype indent on]]

-- Cosmetic improvements
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10
opt.colorcolumn = "80"

-- Vim transparent window configuration
opt.winblend = 0
opt.pumblend = 0

-- Tabs {{{
opt.expandtab = true                -- Use spaces by default
opt.shiftwidth = 4                  -- Set amount of space characters, when we press "<" or ">"
opt.tabstop = 4                     -- 1 tab equal 4 spaces
opt.smartindent = true              -- Turn on smart indentation. See in the docs for more info
opt.autoindent = true
-- }}}

-- Clipboard {{{
opt.clipboard = 'unnamedplus' -- Use system clipboard
opt.fixeol = false -- Turn off appending new line in the end of a file
-- }}}

-- Folding {{{
opt.foldmethod = "expr"
opt.foldexpr = "nvim_treesitter#foldexpr()"
opt.foldlevelstart = 99
-- }}}

-- Search {{{
opt.ignorecase = true               -- Ignore case if all characters in lower case
opt.joinspaces = false              -- Join multiple spaces in search
opt.smartcase = true                -- When there is a one capital letter search for exact match
opt.showmatch = true                -- Highlight search instances
-- }}}

-- Window {{{
opt.splitbelow = true               -- Put new windows below current
opt.splitright = true               -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
opt.wildmenu = true
opt.wildmode = "longest:full,full"
-- }}}

-- Swap {{{
opt.swapfile = false
opt.backup = false
opt.writebackup = false
-- }}}

-- Default Plugins {{{
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    g["loaded_" .. plugin] = 1
end
-- }}}
