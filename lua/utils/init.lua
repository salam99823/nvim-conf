local M = {}

---@param sources cmp.LazySourceConfigs
---@return cmp.SourceConfig[]
function M.sources(sources)
  require("cmp")
  for i, source in ipairs(sources) do
    if type(source) == "string" then
      sources[i] = { name = source }
    elseif source[1] ~= nil then
      source.name = source.name or table.remove(source, 1)
    end
  end
  return sources
end

---@param plugin LazyPlugin
---@param key fun(plugin: LazyPlugin): boolean
---@return LazyPlugin?
function M.super(plugin, key)
  require("lazy")
  plugin = plugin._.super
  while plugin ~= nil and plugin._.super ~= nil and key(plugin) do
    plugin = plugin._.super
  end
  return plugin
end

return M
