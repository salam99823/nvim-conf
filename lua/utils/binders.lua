-- Alias for function, that set new keybindings
-- local map = vim.api.nvim_set_keymap
local map = vim.keymap.set

-- Normal mode keybinding setter
function nm(key, command) 
	map('n', key, command, {noremap = true})
end

-- Input mode keybinding setter
function im(key, command)
	map('i', key, command, {noremap = true})
end

-- Visual mode keybinding setter
function vm(key, command)
	map('v', key, command, {noremap = true})
end

-- Terminal mode keybinding setter
function tm(key, command)
	map('t', key, command, {noremap = true})
end

-- Utility map
function um(mode, key, callback)
	vim.keymap.set(mode, 'lhs', callback, {noremap = true, expr = true})
end
