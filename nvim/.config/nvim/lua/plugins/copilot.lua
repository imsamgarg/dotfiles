-- return {
--   {
--     "zbirenbaum/copilot.lua",
--     cmd = "Copilot",
--     event = "InsertEnter",
--     config = function()
--       require("copilot").setup({
--         suggestion = { enabled = false },
--         panel = { enabled = false },
--         filetypes = {
--           ["*"] = true,
--         },
--       })
--     end,
--     enabled = true,
--     -- enabled = false,
--   },
--   {
--     "zbirenbaum/copilot-cmp",
--     config = function()
--       require("copilot_cmp").setup()
--     end,
--   },
--   { "AndreM222/copilot-lualine" },
--   -- {
--   --   "CopilotC-Nvim/CopilotChat.nvim",
--   --   dependencies = {
--   --     { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
--   --     { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
--   --   },
--   --   build = "make tiktoken", -- Only on MacOS or Linux
--   --   opts = {
--   --     -- See Configuration section for options
--   --   },
--   --   config = function()
--   --     require("copilot_chat").setup({})
--   --   end,
--   --
--   --   -- See Commands section for default commands if you want to lazy load on them
--   -- },
-- }

return {
  "github/copilot.vim",
  enabled = true,
}
