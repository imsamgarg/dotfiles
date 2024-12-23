-- Function to switch to the Flutter log buffer
local function switch_to_flutter_log_buffer()
  local log_buffer_name = "__FLUTTER_DEV_LOG__"
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.api.nvim_buf_is_loaded(buf) then
      local buf_name = vim.api.nvim_buf_get_name(buf)
      if buf_name:match(log_buffer_name) then
        vim.api.nvim_set_current_buf(buf)
        return
      end
    end
  end
  print("Flutter log buffer not found!")
end

local function split_and_switch_to_flutter_logs()
  vim.cmd("split")
  switch_to_flutter_log_buffer()
end

-- Keymap to switch to the Flutter log buffer
vim.keymap.set(
  "n",
  "<leader>fl",
  switch_to_flutter_log_buffer,
  { noremap = true, silent = true, desc = "Switch to Flutter log buffer" }
)
vim.keymap.set(
  "n",
  "<leader>fL",
  split_and_switch_to_flutter_logs,
  { noremap = true, silent = true, desc = "Split and switch to Flutter log buffer" }
)
