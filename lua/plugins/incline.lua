---@module "lazy"
---@module "incline"

---@type LazySpec[]
return {
  {
    "b0o/incline.nvim",
    main = "incline",
    dependencies = {},
    opts = {
      window = {
        padding = 0,
        margin = { horizontal = 0, vertical = 0 },
      },
      render = function(props)
        local helpers = require("incline.helpers")
        local devicons = require("nvim-web-devicons")

        local component_separators = { left = "", right = "" }
        local section_separators = {
          left = {
            "",
          },
          right = {
            "",
          },
        }

        local function get_filename()
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          filename = filename ~= "" and filename or "[No Name]"
          local ft_icon, ft_color = devicons.get_icon_color(filename)
          local icon = ft_icon
              and {
                { ft_icon, guifg = helpers.contrast_color(ft_color) },
                guibg = ft_color,
              }
            or ""
          return icon, filename
        end

        return {
          get_filename(),
          group = props.focused and "lualine_b_normal" or "lualine_b_inactive",
        }
      end,
    },
  },
}
