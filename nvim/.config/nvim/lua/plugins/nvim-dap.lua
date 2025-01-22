return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
    "williamboman/mason.nvim",
    "lucaSartore/nvim-dap-exception-breakpoints",
  },
  config = function()
    local dap = require("dap")
    local ui = require("dapui")

    require("dapui").setup()
    -- Handled by nvim-dap-go
    -- dap.adapters.go = {
    --   type = "server",
    --   port = "${port}",
    --   executable = {
    --     command = "dlv",
    --     args = { "dap", "-l", "127.0.0.1:${port}" },
    --   },
    -- }
    dap.adapters.dart = {
      type = "executable",
      command = "fvm dart",
      args = { "debug_adapter" },
    }
    dap.adapters.flutter = {
      type = "executable",
      command = "fvm flutter",
      args = { "debug_adapter" },
    }

    -- -- run this command to get the path fvm api project | grep 'path' | awk '{print }' | sed 's/[, ]/ /g'
    -- local flutter_path = vim.fn.system("fvm api project | grep 'path' | awk '{print $2}' | sed 's/[, ]/ /g'")
    -- print(flutter_path)
    -- -- add /bin/ to the end of the path
    -- flutter_path = flutter_path .. "/bin/"
    -- print("flutter_path: " .. flutter_path)

    -- get working directory
    dap.configurations.dart = {
      {
        type = "dart",
        request = "launch",
        name = "Launch dart",
        program = "${workspaceFolder}/bin/main.dart", -- ensure this is correct
        cwd = "${workspaceFolder}",
      },
      {
        type = "dart",
        request = "launch",
        name = "Launch flutter",
        program = "${workspaceFolder}/lib/main.dart", -- ensure this is correct
        cwd = "${workspaceFolder}",
      },
    }

    vim.keymap.set("n", "<space>db", dap.toggle_breakpoint, { desc = "Toggle [D]ebugger [B]reakpoint" })
    -- vim.keymap.set("n", "<space>dgb", dap.run_to_cursor)

    -- Eval var under cursor
    vim.keymap.set("n", "<space>d?", function()
      require("dapui").eval(nil, { enter = true })
    end, { desc = "Eval [D]ebugger [?] under cursor" })

    local set_exception_breakpoints = require("nvim-dap-exception-breakpoints")

    vim.api.nvim_set_keymap(
      "n",
      "<leader>de",
      "",
      { desc = "[D]ebug [C]ondition breakpoints", callback = set_exception_breakpoints }
    )

    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<F2>", dap.step_into)
    vim.keymap.set("n", "<F3>", dap.step_over)
    vim.keymap.set("n", "<F4>", dap.step_out)
    vim.keymap.set("n", "<F5>", dap.step_back)
    vim.keymap.set("n", "<leader>dr", dap.restart, { desc = "Restart" })
    vim.keymap.set("n", "<leader>dx", ui.toggle, { desc = "Toggle DAP UI" })

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end
  end,
}
