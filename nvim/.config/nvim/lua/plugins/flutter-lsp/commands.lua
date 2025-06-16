-- Function to trigger "Wrap with Widget"
function PerformAction(title, kind)
  local params = vim.lsp.util.make_range_params()

  params.context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }

  -- Request code actions from the Dart LSP
  vim.lsp.buf_request(0, "textDocument/codeAction", params, function(err, result, ctx, config)
    if result then
      -- Loop through available code actions
      for _, action in pairs(result) do
        if kind then
          if action.kind == kind then
            vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
          end
        elseif action.title == title or string.find(action.title, title) then
          vim.lsp.util.apply_workspace_edit(action.edit, "utf-8")
        end
      end
    end
  end)
end

function RegisterUsingTitle(title, key)
  vim.api.nvim_set_keymap(
    "n",
    "<leader>cf" .. key,
    "<cmd>lua PerformAction('" .. title .. "')<CR>",
    { noremap = true, silent = true }
  )
end

function RegisterWrapWith(widget, key)
  vim.api.nvim_set_keymap(
    "n",
    "<leader>cf" .. key,
    "<cmd>lua PerformAction('Wrap with " .. widget .. "...')<CR>",
    { noremap = true, silent = true }
  )
end

-- Register wrap with widgets
RegisterWrapWith("Widget", "w")
RegisterWrapWith("Center", "c")
RegisterWrapWith("Column", "C")
RegisterWrapWith("Padding", "p")
RegisterWrapWith("SizedBox", "s")
RegisterWrapWith("Row", "R")
RegisterWrapWith("Builder", "b")
RegisterWrapWith("Expanded", "e")
RegisterWrapWith("Flexible", "E")
RegisterWrapWith("ValueListenableBuilder", "v")
RegisterUsingTitle("Remove this widget", "r")

-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfw",
--   "<cmd>lua PerformAction('Wrap with widget...')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfc",
--   "<cmd>lua PerformAction('Wrap with Center')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfC",
--   "<cmd>lua PerformAction('Wrap with Column')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfp",
--   "<cmd>lua PerformAction('Wrap with Padding')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfs",
--   "<cmd>lua PerformAction('Wrap with SizedBox')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfR",
--   "<cmd>lua PerformAction('Wrap with Row')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfb",
--   "<cmd>lua PerformAction('Wrap with Builder')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfe",
--   "<cmd>lua PerformAction('Wrap with Expanded')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfE",
--   "<cmd>lua PerformAction('Wrap with Flexible')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfv",
--   "<cmd>lua PerformAction('Wrap with ValueListenableBuilder')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfs",
--   "<cmd>lua PerformAction('Wrap with SizedBox')<CR>",
--   { noremap = true, silent = true }
-- )
-- vim.api.nvim_set_keymap(
--   "n",
--   "<leader>cfr",
--   "<cmd>lua PerformAction('Remove this widget')<CR>",
--   { noremap = true, silent = true }
-- )
-- Register "Import library" command

-- TODO: debug this
vim.api.nvim_set_keymap(
  "n",
  "<leader>cff",

  -- kind = "quickfix.import.libraryProject3"
  "<cmd>lua PerformAction('Import library','quickfix.import.libraryProject3')<CR>",
  { noremap = true, silent = true }
)
