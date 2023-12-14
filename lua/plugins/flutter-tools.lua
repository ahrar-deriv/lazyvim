return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      debugger = {
        -- integrate with nvim dap + install dart code debugger
        enabled = true,
        run_via_dap = true, -- use dap instead of a plenary job to run flutter apps
        register_configurations = function()
          require("dap").configurations.dart = {
            {
              dartSdkPath = "$DART_SDK",
              name = "Flutter Dev",
              request = "launch",
              flutterSdkPath = "$FLUTTER_SDK",
              type = "dart",
              program = "lib/main_development.dart",
              args = { "--flavor", "development" },
            },
            {
              dartSdkPath = "$DART_SDK",
              name = "flutter",
              request = "launch",
              flutterSdkPath = "$FLUTTER_SDK",
              type = "dart",
              program = "lib/main.dart",
            },
          }
        end,
      },

      widget_guides = {
        enabled = true,
      },
      closing_tags = {
        highlight = "Comment", -- highlight for the closing tag
        prefix = "^", -- character to use for close tag e.g. > Widget
        enabled = true, -- set to false to disable
      },
    })
  end,
}
