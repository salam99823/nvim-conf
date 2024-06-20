---@module "lazy"
---@module "lualine"

---@type LazySpec[]
return {
  {
    "nvim-lualine/lualine.nvim",
    ---@param _ LazyPlugin
    ---@param opts table
    ---@return table
    opts = function(_, opts)
      local icons = LazyVim.config.icons
      local component_separators = { left = "", right = "" }
      local section_separators = { left = "", right = "" }
      local extreme_element_separators =
        { left = section_separators.right, right = section_separators.left }
      opts = {
        options = vim.tbl_deep_extend("force", opts.options or {}, {
          globalstatus = true,
          component_separators = component_separators,
          section_separators = section_separators,
        }),
        sections = {
          lualine_a = {
            {
              "mode",
              separator = extreme_element_separators,
            },
          },
          lualine_b = {
            "branch",
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_c = {},
          lualine_x = vim.list_slice(opts.sections.lualine_x, 1, 4),
          lualine_y = {
            "progress",
            "location",
          },
          lualine_z = {
            {
              "datetime",
              style = "%A, %d %B  %T",
              separator = extreme_element_separators,
            },
          },
        },
      }
      return opts
    end,
  },
}
