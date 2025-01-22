-- with lazy.nvim
return {
  "LintaoAmons/bookmarks.nvim",
  -- recommand, pin the plugin at specific version for stability
  -- backup your db.json file when you want to upgrade the plugin
  tag = "v2.0.0",
  dependencies = {
    { "kkharji/sqlite.lua" },
    { "nvim-telescope/telescope.nvim" },
    { "stevearc/dressing.nvim" }, -- optional: better UI
  },
  config = function()
    local opts = {} -- go to the following section to see all the options
    require("bookmarks").setup(opts) -- you must call setup to init sqlite db
    vim.keymap.set(
      { "n", "v" },
      "<leader>mm",
      "<cmd>BookmarksMark<cr>",
      { desc = "Mark current line into active BookmarkList." }
    )
    vim.keymap.set(
      { "n", "v" },
      "<leader>mgd",
      "<cmd>BookmarksGoto<cr>",
      { desc = "Go to bookmark at current active BookmarkList" }
    )
    vim.keymap.set({ "n", "v" }, "<leader>mt", "<cmd>BookmarksTree<cr>", { desc = "Browse bookmarks in tree view." })
    vim.keymap.set(
      { "n", "v" },
      "<leader>ma",
      "<cmd>BookmarksCommands<cr>",
      { desc = "Find and trigger a bookmark command." }
    )
    -- Command 	Description
    -- BookmarksMark 	Mark current line into active BookmarkList. Rename existing bookmark under cursor. Toggle it off if the new name is an empty string
    -- BookmarksGoto 	Go to bookmark at current active BookmarkList
    -- BookmarksDesc 	Add description to the bookmark under cursor, if no bookmark, then mark it first
    -- BookmarksTree 	Browse bookmarks in tree view
    -- BookmarksCommands 	Find bookmark commands and trigger it
    -- BookmarksInfo 	Overview plugin current status
    -- BookmarksInfoCurrentBookmark 	Show current bookmark info
    -- BookmarksGrep 	Grep through the content of all bookmarked files
    -- BookmarksLists 	Pick a bookmark list
    -- BookmarksNewList 	Create a new bookmark list
    -- BookmarkRebindOrphanNode 	Rebind orphaned nodes by attaching them to the root node
    vim.keymap.set(
      { "n", "v" },
      "<leader>md",
      "<cmd>BookmarksDesc<cr>",
      { desc = "Add description to the bookmark under cursor, if no bookmark, then mark it first." }
    )
    vim.keymap.set(
      { "n", "v" },
      "<leader>msg",
      "<cmd>BookmarksGrep<cr>",
      { desc = "Grep through the content of all bookmarked files." }
    )
    vim.keymap.set({ "n", "v" }, "<leader>msf", "<cmd>BookmarksLists<cr>", { desc = "Pick a bookmark list." })
  end,
  enabled = false,
}

-- run :BookmarksInfo to see the running status of the plugin
