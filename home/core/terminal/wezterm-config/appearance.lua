local wezterm = require('wezterm')
return {
  term = "xterm-256color",
  animation_fps = 144,
  max_fps = 144,
  front_end = 'WebGpu',
  webgpu_power_preference = 'HighPerformance',

  color_scheme = 'Catppuccin Macchiato',
  default_cursor_style = 'SteadyBar',
  enable_scroll_bar = false,
  font_size = 14.0,
  font = wezterm.font 'JetBrainsMono Nerd Font Mono',
  hide_tab_bar_if_only_one_tab = true,
  scrollback_lines = 10000,

  window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
  },
}
