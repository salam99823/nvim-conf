-- Alias for function, that set new keybindings
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

-- Normal mode keybinding setter
function Nm(key, command)
	map('n', key, command, {noremap = true})
end

-- Input mode keybinding setter
function Im(key, command)
	map('i', key, command, {noremap = true})
end

-- Visual mode keybinding setter
function Vm(key, command)
	map('v', key, command, {noremap = true})
end

-- Terminal mode keybinding setter
function Tm(key, command)
	map('t', key, command, {noremap = true})
end

-- Utility map
function Um(mode, key, callback)
	map(mode, key, callback, {noremap = true, expr = true})
end
