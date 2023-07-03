return {
  {
    lazy = false,
    "mfussenegger/nvim-dap",
    dependencies = {
      { "rcarriga/nvim-dap-ui" },
      { "theHamsta/nvim-dap-virtual-text" },
      { "nvim-telescope/telescope-dap.nvim" },
      { "jbyuki/one-small-step-for-vimkind" },
    },
    keys = {
      {
        "<leader>dR",
        function()
          require("dap").run_to_cursor()
        end,
        desc = "Run to Cursor",
      },
      {
        "<leader>dE",
        function()
          require("dapui").eval(vim.fn.input("[Expression] > "))
        end,
        desc = "Evaluate Input",
      },
      {
        "<leader>dC",
        function()
          require("dap").set_breakpoint(vim.fn.input("[Condition] > "))
        end,
        desc = "Conditional Breakpoint",
      },
      {
        "<leader>dU",
        function()
          require("dapui").toggle()
        end,
        desc = "Toggle UI",
      },
      {
        "<leader>db",
        function()
          require("dap").step_back()
        end,
        desc = "Step Back",
      },
      {
        "<leader>dc",
        function()
          require("dap").continue()
        end,
        desc = "Continue",
      },
      {
        "<leader>dd",
        function()
          require("dap").disconnect()
        end,
        desc = "Disconnect",
      },
      {
        "<leader>de",
        function()
          require("dapui").eval()
        end,
        mode = { "n", "v" },
        desc = "Evaluate",
      },
      {
        "<leader>dg",
        function()
          require("dap").session()
        end,
        desc = "Get Session",
      },
      {
        "<leader>dh",
        function()
          require("dap.ui.widgets").hover()
        end,
        desc = "Hover Variables",
      },
      {
        "<leader>dS",
        function()
          require("dap.ui.widgets").scopes()
        end,
        desc = "Scopes",
      },
      {
        "<leader>di",
        function()
          require("dap").step_into()
        end,
        desc = "Step Into",
      },
      {
        "<leader>do",
        function()
          require("dap").step_over()
        end,
        desc = "Step Over",
      },
      {
        "<leader>dp",
        function()
          require("dap").pause.toggle()
        end,
        desc = "Pause",
      },
      {
        "<leader>dq",
        function()
          require("dap").close()
        end,
        desc = "Quit",
      },
      {
        "<leader>dr",
        function()
          require("dap").repl.toggle()
        end,
        desc = "Toggle REPL",
      },
      {
        "<leader>ds",
        function()
          require("dap").continue()
        end,
        desc = "Start",
      },
      {
        "<leader>dt",
        function()
          require("dap").toggle_breakpoint()
        end,
        desc = "Toggle Breakpoint",
      },
      {
        "<leader>dx",
        function()
          require("dap").terminate()
        end,
        desc = "Terminate",
      },
      {
        "<leader>du",
        function()
          require("dap").step_out()
        end,
        desc = "Step Out",
      },
    },
    opts = {
      setup = {
        osv = function(_, _)
          require("plugins.dap.lua").setup()
        end,
      },
    },
    config = function(plugin, opts)
      require("nvim-dap-virtual-text").setup({
        commented = true,
      })

      local dap, dapui = require("dap"), require("dapui")
      dapui.setup({})

      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      dap.adapters.dart = {
        type = "executable",
        command = "node",
        args = { os.getenv("HOME") .. "/.local/share/nvim/dapinstall/dart-code/out/dist/debug.js", "flutter" },
      }
      dap.configurations.dart = {
        {
          type = "dart",
          request = "launch",
          name = "Launch Flutter",
          dartSdkPath = os.getenv("HOME") .. "/Development/flutter/bin/cache/dart-sdk/",
          flutterSdkPath = os.getenv("HOME") .. "/Development/flutter",
          program = "${workspaceFolder}/lib/main.dart",
          cwd = "${workspaceFolder}",
        },
        {
          type = "dart",
          dartSdkPath = os.getenv("HOME") .. "/Development/flutter/bin/cache/dart-sdk/",
          name = "Flutter Dev",
          request = "launch",
          flutterSdkPath = os.getenv("HOME") .. "/Development/flutter",
          program = "lib/main_dev.dart",
          args = { "--flavor", "dev" },
        },
      }
      -- set up debugger
      for k, _ in pairs(opts.setup) do
        opts.setup[k](plugin, opts)
      end
    end,
  },
  --add nvim-dap-ui
  -- {
  --   "rcarriga/nvim-dap-ui",
  --   after = "nvim-dap",
  --   config = function()
  --     require("dapui").setup({
  --       icons = { expanded = "▾", collapsed = "▸", current_frame = "▸" },
  --       mappings = {
  --         -- Use a table to apply multiple mappings
  --         expand = { "<CR>", "<2-LeftMouse>" },
  --         open = "o",
  --         remove = "d",
  --         edit = "e",
  --         repl = "r",
  --         toggle = "t",
  --       },
  --       -- Expand lines larger than the window
  --       -- Requires >= 0.7
  --       expand_lines = vim.fn.has("nvim-0.7"),
  --       -- Layouts define sections of the screen to place windows.
  --       -- The position can be "left", "right", "top" or "bottom".
  --       -- The size specifies the height/width depending on position. It can be an Int
  --       -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
  --       -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
  --       -- Elements are the elements shown in the layout (in order).
  --       -- Layouts are opened in order so that earlier layouts take priority in window sizing.
  --       layouts = {
  --         {
  --           elements = {
  --             -- Elements can be strings or table with id and size keys.
  --             { id = "scopes", size = 0.25 },
  --             "breakpoints",
  --             "stacks",
  --             "watches",
  --           },
  --           size = 40, -- 40 columns
  --           position = "left",
  --         },
  --         {
  --           elements = {
  --             "repl",
  --             "console",
  --           },
  --           size = 0.25, -- 25% of total lines
  --           position = "bottom",
  --         },
  --       },
  --       controls = {
  --         -- Requires Neovim nightly (or 0.8 when released)
  --         enabled = true,
  --         -- Display controls in this element
  --         element = "repl",
  --         icons = {
  --           pause = "",
  --           play = "",
  --           step_into = "",
  --           step_over = "",
  --           step_out = "",
  --           step_back = "",
  --           run_last = "↻",
  --           terminate = "□",
  --         },
  --       },
  --       floating = {
  --         max_height = nil,  -- These can be integers or a float between 0 and 1.
  --         max_width = nil,   -- Floats will be treated as percentage of your screen.
  --         border = "single", -- Border style. Can be "single", "double" or "rounded"
  --         mappings = {
  --           close = { "q", "<Esc>" },
  --         },
  --       },
  --       windows = { indent = 1 },
  --       render = {
  --         max_type_length = nil, -- Can be integer or nil.
  --         max_value_lines = 100, -- Can be integer or nil.
  --       },
  --     })
  --   end,
}
