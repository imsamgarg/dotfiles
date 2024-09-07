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
    },
    formatters_by_ft = {
      lua = { "stylua" },
      -- You can use a sub-list to tell conform to run *until* a formatter
      -- is found.
      javascript = { "prettierd", "prettier", stop_after_first = true },
      typescript = { "prettierd", "prettier", stop_after_first = true },
      json = { "prettierd", "prettier", stop_after_first = true },
    },
  },
}
