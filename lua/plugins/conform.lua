---@type LazyPluginSpec[]
return {
  {
    "stevearc/conform.nvim",
    ---@type conform.setupOpts?
    opts = {
      formatters_by_ft = {
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
      },
    },
  },
}
