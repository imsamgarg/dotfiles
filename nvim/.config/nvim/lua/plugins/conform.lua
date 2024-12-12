return { -- Autoformat
  "stevearc/conform.nvim",
  lazy = false,
  -- keys = {
  --   {
  --     "<leader>cf",
  --     function()
  --       require("conform").format({ async = true, lsp_fallback = true })
  --     end,
  --     mode = "",
  --     desc = "[F]ormat buffer",
  --   },
  -- },
  opts = {
    notify_on_error = true,
    format_on_save = function(bufnr)
      -- Disable "format_on_save lsp_fallback" for languages that don't
      -- have a well standardized coding style. You can add additional
      -- languages here or re-enable it for the disabled ones.
      local disable_filetypes = { c = true, cpp = true }
      return {
        timeout_ms = 5000,
        lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
      }
    end,
    formatters = {
      stylua = {
        command = "stylua",
        prepend_args = { "--indent-width", "2", "--indent-type", "Spaces" },
      },
      biome = {
        command = "biome",
        args = { "format", "--stdin-file-path", "$FILENAME", "--config-path=" .. vim.fn.stdpath("config") .. "/biome/" },
      },
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { "biome", "prettierd", "prettier", stop_after_first = true },
      typescript = { "biome", "prettierd", "prettier", stop_after_first = true },
      json = {
        "biome",
        "prettierd",
        "prettier",
        stop_after_first = true,
      },
      arb = { "prettierd", "prettier", stop_after_first = true, append_args = { "--parser", "json" } },
    },
  },
}
