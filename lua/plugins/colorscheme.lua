return {
  {
    lazy = false,
    "tokyonight.nvim",
    priority = 1000,
    name = "tokyonight",
    config = function()
      require("tokyonight").setup({
        style = "night", -- night, storm, day
        --light_style = "day", -- The theme is used when the background is set to light
        transparent = true, -- Enable this to disable setting the background color
        terminal_colors = true, -- Configure the colors used when opening a `:terminal` in [Neovim](https://github.com/neovim/neovim)
        styles = {
          -- Style to be applied to different syntax groups
          -- Value is any valid attr-list value for `:help nvim_set_hl`
          --  comments = { italic = true },
          -- keywords = { italic = true },
          -- functions = {},
          -- variables = {},
          -- Background styles. Can be "dark", "transparent" or "normal"
          sidebars = "transparent", -- style for sidebars, see below
          floats = "transparent", -- style for floating windows
        },
        --sidebars = { "qf", "help" }, -- Set a darker background on sidebar-like windows. For example: `["qf", "vista_kind", "terminal", "packer"]`
        --day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
        --hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead. Should work with the standard **StatusLine** and **LuaLine**.
        --dim_inactive = false, -- dims inactive windows
        --lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

        --- You can override specific color groups to use other groups or a hex color
        --- function will be called with a ColorScheme table
        ---@param colors ColorScheme
        on_colors = function(colors)
          colors.jt_base = "#2B2B2B"
          colors.jt_mantle = "#313335"
          colors.jt_crust = "#3D3F41"
          colors.jt_rosewater = "#F2D5CF"
          colors.jt_flamingo = "#EEBEBE"
          colors.jt_pink = "#F4B8E4"
          colors.jt_mauve = "#B8773F"
          colors.jt_red = "#E78284"
          colors.jt_maroon = "#EA999C"
          colors.jt_peach = "#EF9F76"
          colors.jt_yellow = "#F6C87B"
          colors.jt_green = "#70865E"
          colors.jt_teal = "#9377A7"
          colors.jt_sky = "#99D1DB"
          colors.jt_sapphire = "#85C1DC"
          colors.jt_blue = "#8CAAEE"
          colors.jt_lavender = "#9377A7"
          colors.jt_text = "#ACB7C4"
          colors.jt_subtext1 = "#b5bfe2"
          colors.jt_subtext0 = "#a5adce"
          colors.jt_overlay2 = "#949cbb"
          colors.jt_overlay1 = "#838ba7"
          colors.jt_overlay0 = "#737994"
          colors.jt_surface2 = "#626880"
          colors.jt_surface1 = "#51576d"
          colors.jt_surface0 = "#414559"
          colors.jt_yellow = "#F6C87B"

          colors.bg = colors.jt_base
          colors.bg_dark = colors.jt_mantle
          colors.bg_float = colors.jt_mantle
          colors.bg_highlight = colors.jt_crust
          colors.bg_popup = colors.jt_mantle
          colors.bg_search = "#3d59a1"
          colors.bg_sidebar = colors.jt_mantle
          colors.bg_statusline = colors.jt_mantle
          colors.bg_visual = colors.jt_crust
          colors.black = "#15161e"
          colors.blue = colors.jt_blue
          colors.blue0 = colors.jt_rosewater
          colors.blue1 = colors.jt_yellow
          colors.blue2 = colors.jt_maroon
          colors.blue5 = "#89ddff"
          colors.blue6 = "#b4f9f8"
          colors.blue7 = "#394b70"
          colors.border = "#15161e"
          colors.border_highlight = "#27a1b9"
          colors.comment = "#6f756a"
          colors.cyan = colors.jt_peach
          colors.dark3 = "#545c7e"
          colors.dark5 = "#737aa2"
          colors.delta = {
            add = "#2c5a66",
            delete = "#713137",
          }
          colors.diff = {
            add = "#20303b",
            change = "#1f2231",
            delete = "#37222c",
            text = "#394b70",
          }
          colors.error = "#db4b4b"
          colors.fg = colors.jt_text
          -- colors.fg = "#c0caf5"
          colors.fg_dark = "#a9b1d6"
          colors.fg_float = "#c0caf5"
          colors.fg_gutter = "#3b4261"
          colors.fg_sidebar = "#a9b1d6"
          colors.git = {
            add = "#449dab",
            change = "#6183bb",
            delete = "#914c54",
            ignore = "#545c7e",
          }
          colors.gitSigns = {
            add = "#266d6a",
            change = "#536c9e",
            delete = "#b2555b",
          }
          colors.green = colors.jt_green
          colors.green1 = colors.jt_lavender
          colors.green2 = "#41a6b5"
          colors.hint = "#1abc9c"
          colors.info = "#0db9d7"
          colors.magenta = colors.jt_peach
          colors.magenta2 = "#ff007c"
          colors.none = "NONE"
          colors.orange = colors.jt_red
          colors.purple = colors.jt_mauve
          colors.red = "#f7768e"
          colors.red1 = "#db4b4b"
          colors.teal = "#1abc9c"
          colors.terminal_black = "#414868"
          colors.warning = "#e0af68"
          colors.yellow = colors.jt_red
        end,

        --- You can override specific highlights to use other groups or a hex color
        --- function will be called with a Highlights and ColorScheme table
        ---@param highlights Highlights
        ---@param colors ColorScheme
        on_highlights = function(highlights, colors)
          colors.jt_pink = "#F4B8E4"
          colors.jt_green = "#70865E"

          highlights.Comment = {
            fg = colors.jt_green,
            style = {
              italic = true,
            },
          }
          highlights["@punctuation.delimiter"] = {
            fg = colors.jt_pink,
          }
          highlights["@punctuation.special"] = {
            fg = colors.jt_pink,
          }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
