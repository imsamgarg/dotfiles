return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    -- bigfile = { enabled = true },
    dashboard = {
      enabled = true,
      preset = {
        header = [[
███████╗ █████╗ ███╗   ███╗███████╗    ███╗   ██╗██╗   ██╗██╗███╗   ███╗
██╔════╝██╔══██╗████╗ ████║██╔════╝    ████╗  ██║██║   ██║██║████╗ ████║
███████╗███████║██╔████╔██║███████╗    ██╔██╗ ██║██║   ██║██║██╔████╔██║
╚════██║██╔══██║██║╚██╔╝██║╚════██║    ██║╚██╗██║╚██╗ ██╔╝██║██║╚██╔╝██║
███████║██║  ██║██║ ╚═╝ ██║███████║    ██║ ╚████║ ╚████╔╝ ██║██║ ╚═╝ ██║
╚══════╝╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝    ╚═╝  ╚═══╝  ╚═══╝  ╚═╝╚═╝     ╚═╝
        ]],
      },
      sections = {
        { section = "header" },
        -- {
        --   pane = 2,
        --   section = "terminal",
        --   cmd = "colorscript -e square",
        --   height = 5,
        --   padding = 1,
        -- },
        -- { section = "keys", gap = 1, padding = 1 },
        -- { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        {
          icon = " ",
          title = "Projects",
          section = "projects",
          indent = 2,
          padding = 1,
          limit = 15,
          -- dirs = {
          --   "~/personal_projects/flutter/",
          --   "~/personal_projects/node/",
          --   "~/work_projects/node",
          --   "~/work_projects/flutter",
          -- },
          -- dirs = function()
          --   local dirs = {}
          --   local home = os.getenv("HOME")
          --   local personal_flutter_projects = vim.fs.dir(home .. "/personal_projects/flutter", {})
          --
          --   -- personal_flutter_projects is a iterator
          --   if personal_flutter_projects then
          --     for name, type in personal_flutter_projects do
          --       if type == "directory" then
          --         table.insert(dirs, home .. "/personal_projects/flutter/" .. name)
          --       end
          --     end
          --   end
          --
          --   return dirs
          --
          --   -- local personal_projects = {
          --   --   home .. "/personal_projects/flutter/",
          --   --   home .. "/personal_projects/node/",
          --   -- }
          --   -- local work_projects = {
          --   --   home .. "/work_projects/node",
          --   --   home .. "/work_projects/flutter",
          --   -- }
          --   -- for _, dir in ipairs(personal_projects) do
          --   --   table.insert(dirs, dir)
          --   -- end
          --   -- for _, dir in ipairs(work_projects) do
          --   --   table.insert(dirs, dir)
          --   -- end
          --   -- return dirs
          -- end,
        },

        -- {
        --   pane = 2,
        --   icon = " ",
        --   title = "Git Status",
        --   section = "terminal",
        --   enabled = function()
        --     return Snacks.git.get_root() ~= nil
        --   end,
        --   cmd = "git status --short --branch --renames",
        --   height = 5,
        --   padding = 1,
        --   ttl = 5 * 60,
        --   indent = 3,
        -- },
        { section = "startup" },
      },
    },
    -- indent = { enabled = true },
    -- input = { enabled = true },
    -- notifier = { enabled = true },
    -- quickfile = { enabled = true },
    -- scroll = { enabled = true },
    -- statuscolumn = { enabled = true },
    -- words = { enabled = true },
    lazygit = { configure = true, enabled = true },
  },
  keys = {
    -- {
    --   "<leader>gb",
    --   function()
    --     Snacks.git.blame_line()
    --   end,
    --   desc = "Git Blame Line",
    -- },
    -- {
    --   "<leader>gf",
    --   function()
    --     Snacks.lazygit.log_file()
    --   end,
    --   desc = "Lazygit Current File History",
    -- },
    {
      "<leader>g",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    -- {
    --   "<leader>gl",
    --   function()
    --     Snacks.lazygit.log()
    --   end,
    --   desc = "Lazygit Log (cwd)",
    -- },
  },
  init = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "VeryLazy",
      callback = function()
        -- Setup some globals for debugging (lazy-loaded)
        _G.dd = function(...)
          Snacks.debug.inspect(...)
        end
        _G.bt = function()
          Snacks.debug.backtrace()
        end
        vim.print = _G.dd -- Override print to use snacks for `:=` command

        -- Create some toggle mappings
        Snacks.toggle.option("spell", { name = "Spelling" }):map("<leader>us")
        Snacks.toggle.option("wrap", { name = "Wrap" }):map("<leader>uw")
        Snacks.toggle.option("relativenumber", { name = "Relative Number" }):map("<leader>uL")
        Snacks.toggle.diagnostics():map("<leader>ud")
        Snacks.toggle.line_number():map("<leader>ul")
        Snacks.toggle
          .option("conceallevel", { off = 0, on = vim.o.conceallevel > 0 and vim.o.conceallevel or 2 })
          :map("<leader>uc")
        Snacks.toggle.treesitter():map("<leader>uT")
        Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
        Snacks.toggle.inlay_hints():map("<leader>uh")
        Snacks.toggle.indent():map("<leader>ug")
        Snacks.toggle.dim():map("<leader>uD")
      end,
    })
  end,
}
