---@module "lazy"
---@module "conform"

---@type LazySpec[]
return {
  {
    "stevearc/conform.nvim",
    ---@param _ LazyPlugin
    ---@param opts conform.setupOpts
    ---@return conform.setupOpts
    opts = function(_, opts)
      opts = opts or {}
      opts.formatters_by_ft = vim.tbl_deep_extend("force", opts.formatters_by_ft or {}, {
        lua = { "stylua" },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        javascript = { { "prettierd", "prettier" } },
        typescript = { { "prettierd", "prettier" } },
        json = { { "prettierd", "prettier", "biome" } },
        css = { { "prettierd", "prettier" } },
        markdown = { { "prettierd", "prettier", "markdownlint" } },
        yaml = { { "prettierd", "prettier" } },
        rust = { "rustfmt" },
        toml = { "taplo" },
      })
      return opts
    end,
  },
}
