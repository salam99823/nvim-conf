local function Nm(key, command) -- Normal mode keybinding setter
	vim.keymap.set("n", key, command, { noremap = true })
end
local function Im(key, command) -- Input mode keybinding setter
	vim.keymap.set("i", key, command, { noremap = true })
end
local function Vm(key, command) -- Visual mode keybinding setter
	vim.keymap.set("v", key, command, { noremap = true })
end
local function Tm(key, command) -- Terminal mode keybinding setter
	vim.keymap.set("t", key, command, { noremap = true })
end
local function Um(mode, key, callback) -- Utility map
	vim.keymap.set(mode, key, callback, { noremap = true, expr = true })
end

Im("jk", "<esc>")
Nm("<leader>bn", "<cmd>bn<cr>")
Nm("<leader>bp", "<cmd>bp<cr>")
Nm("<esc>", "<cmd>nohlsearch<cr>")
