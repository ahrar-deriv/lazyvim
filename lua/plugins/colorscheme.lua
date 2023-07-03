return {
  {
    lazy = false,
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        -- flavour = "all", -- mocha, macchiato, frappe, latte
        color_overrides = {
          all = {
            base = "#2B2B2B",
            mantle = "#313335",
            crust = "#3D3F41",
            rosewater = "#F2D5CF",
            flamingo = "#EEBEBE",
            pink = "#F4B8E4",
            mauve = "#B8773F",
            red = "#E78284",
            maroon = "#EA999C",
            peach = "#EF9F76",
            yellow = "#F6C87B",
            green = "#70865E",
            teal = "#9377A7",
            sky = "#99D1DB",
            sapphire = "#85C1DC",
            blue = "#8CAAEE",
            lavender = "#9377A7",
            text = "#ACB7C4",
            subtext1 = "#b5bfe2",
            subtext0 = "#a5adce",
            overlay2 = "#949cbb",
            overlay1 = "#838ba7",
            overlay0 = "#737994",
            surface2 = "#626880",
            surface1 = "#51576d",
            surface0 = "#414559",
          },
        },
        custom_highlights = function(colors)
          return {
            Comment = { fg = colors.green },
            -- ["@constant.builtin"] = { fg = colors.peach, style = {} },
            ["@comment"] = { fg = colors.green, style = { "italic" } },
          }
        end,
      })
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
