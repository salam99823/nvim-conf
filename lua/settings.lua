--[[
    File: settings.lua
    Description: Base settings for neovim
]]

require "utils.aliases"

-- Set association between turned on plugins and filetype
Cmd[[filetype plugin on]]

-- Set association between indent side and filetype
Cmd[[filetype indent on]]

-- Cosmetic improvements
Opt.number = true
Opt.relativenumber = true
Opt.cursorline = true
Opt.scrolloff = 10
Opt.colorcolumn = "80"

-- Vim transparent window configuration
Opt.winblend = 0
Opt.pumblend = 0

-- Tabs {{{
Opt.expandtab = true                -- Use spaces by default
Opt.shiftwidth = 2                  -- Set amount of space characters, when we press "<" or ">"
Opt.tabstop = 2                     -- 1 tab equal 2 spaces
Opt.smartindent = true              -- Turn on smart indentation. See in the docs for more info
Opt.autoindent = true
-- }}}

-- Clipboard {{{
Opt.clipboard = 'unnamedplus' -- Use system clipboard
Opt.fixeol = false -- Turn off appending new line in the end of a file
-- }}}

-- Folding {{{
Opt.foldmethod = "expr"
Opt.foldexpr = "nvim_treesitter#foldexpr()"
Opt.foldlevelstart = 99
-- }}}

-- Search {{{
Opt.ignorecase = true               -- Ignore case if all characters in lower case
Opt.joinspaces = false              -- Join multiple spaces in search
Opt.smartcase = true                -- When there is a one capital letter search for exact match
Opt.showmatch = true                -- Highlight search instances
-- }}}

-- Window {{{
Opt.splitbelow = true               -- Put new windows below current
Opt.splitright = true               -- Put new vertical splits to right
-- }}}

-- Wild Menu {{{
Opt.wildmenu = true
Opt.wildmode = "longest:full,full"
-- }}}

-- Swap {{{
Opt.swapfile = false
Opt.backup = false
Opt.writebackup = false
-- }}}
