---@type LazyPluginSpec[]
return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      opts.options.component_separators = { left = "", right = "" }
      opts.options.section_separators = { left = "", right = "" }
      opts.sections.lualine_a[1] = {
        "mode",
        separator = { left = "", right = "" },
      }
      table.insert(opts.sections.lualine_b, table.remove(opts.sections.lualine_x, 5))
      opts.sections.lualine_z[1] = {
        "datetime",
        style = "%A, %d %B  %T",
        separator = { left = "", right = "" },
      }
      opts.sections.lualine_y = {
        "progress",
        "location",
      }
      return opts
    end,
  },
}
