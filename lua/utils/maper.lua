local M = {}

---@param key string
---@param command string | fun():nil
function M.Nm(key, command) -- Normal mode keybinding setter
  vim.keymap.set("n", key, command, { noremap = true })
end

---@param key string
---@param command string | fun():nil
function M.Im(key, command) -- Input mode keybinding setter
  vim.keymap.set("i", key, command, { noremap = true })
end

---@param key string
---@param command string | fun():nil
function M.Vm(key, command) -- Visual mode keybinding setter
  vim.keymap.set("v", key, command, { noremap = true })
end

---@param key string
---@param command string | fun():nil
function M.Tm(key, command) -- Terminal mode keybinding setter
  vim.keymap.set("t", key, command, { noremap = true })
end

---@param key string
---@param command string | fun():nil
function M.Um(mode, key, command) -- Utility map
  vim.keymap.set(mode, key, command, { noremap = true, expr = true })
end

return M
