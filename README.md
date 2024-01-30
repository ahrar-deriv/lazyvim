# 💤 LazyVim Custom Config

install neovim and copy this repo to `.config/nvim/`

install Nerd Font to get the icons as well <br>

```
$ brew tap homebrew/cask-fonts && brew install --cask font-jetbrains-mono-nerd-font
```

it's best to install wezterm for your terminal and copy the code bellow to `.config/wezterm/wezterm.lua`

```Lua
local wezterm = require("wezterm")
local config = {
        font = wezterm.font("JetBrainsMono Nerd Font"),
        font_size = 15.0,
        line_height = 1.3,
        hide_tab_bar_if_only_one_tab = true,
        window_decorations = "RESIZE",
        window_padding = {
                left = 0,
                right = 0,
                top = 0,
                bottom = 0,
        },
        max_fps = 120,
        force_reverse_video_cursor = false,
        front_end = "WebGpu",
        webgpu_power_preference = "HighPerformance",
}
config.window_background_opacity = 0.85
config.macos_window_background_blur = 200
config.color_scheme = "Darcula (base16)"
config.default_cursor_style = "BlinkingBar"
config.animation_fps = 120

return config
```
