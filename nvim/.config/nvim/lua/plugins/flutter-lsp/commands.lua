-- Function to trigger "Wrap with Widget"
function PerformAction(title)
  local params = vim.lsp.util.make_range_params()

  params.context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }

  -- Request code actions from the Dart LSP
  vim.lsp.buf_request(0, "textDocument/codeAction", params, function(err, result, ctx, config)
    if result then
      -- Loop through available code actions
      for _, action in pairs(result) do
        print(action.title)
        if action.title == title then
          print(vim.inspect(action))

          vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
        end
      end
    end
  end)
end

vim.api.nvim_set_keymap(
  "n",
  "<leader>cfw",
  "<cmd>lua PerformAction('Wrap with widget...')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>cfc",
  "<cmd>lua PerformAction('Wrap with Container')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>cfC",
  "<cmd>lua PerformAction('Wrap with Column')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>cfp",
  "<cmd>lua PerformAction('Wrap with Padding')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>cfs",
  "<cmd>lua PerformAction('Wrap with SizedBox')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>cfr",
  "<cmd>lua PerformAction('Wrap with Row')<CR>",
  { noremap = true, silent = true }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>cfR",
  "<cmd>lua PerformAction('Remove this widget')<CR>",
  { noremap = true, silent = true }
)
