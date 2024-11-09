vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command("BdeleteAll", function()
  vim.cmd("bufdo bd")
end, {})

vim.api.nvim_create_user_command("Q", function()
  vim.cmd("bd")
end, {})

-- start ngrok
vim.api.nvim_create_user_command("Ngrok", function(opts)
  local port = opts[1] or "3000"
  vim.cmd("terminal ngrok http --domain=wanted-skunk-blindly.ngrok-free.app " .. port)
end, {})

-- run node in debug mode
vim.api.nvim_create_user_command("RunNode", function(opts)
  local command = opts[1] or "start:qa"
  local port = opts[2] or "3000"
  vim.cmd("split | terminal npm run " .. command)
  vim.cmd("vsplit")
  vim.cmd("terminal ngrok http --domain=wanted-skunk-blindly.ngrok-free.app " .. port)
end, {})

vim.api.nvim_create_user_command("FlutterGenL10n", function()
  vim.cmd("terminal flutter gen-l10n")
end, {})
