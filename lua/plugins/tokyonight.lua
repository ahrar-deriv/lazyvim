return {
  {
    "folke/tokyonight.nvim",
    lazy = true,
    -- opts = { style = "day" },
    require("tokyonight").setup({
      -- use the night style
      style = "day",
      -- Change the "hint" color to the "orange" color, and make the "error" color bright red
      on_colors = function(colors)
        colors.bg = "#ffffff"
      end,
    }),
  },
  --
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "tokyonight",
  --   },
  -- },
}
