{ ... }:
{
  programs = {
    kitty = {
      enable = true;
      environment = { };
      keybindings = { };
      font.name = "jetbrains mono nerd font";
      font.size = 14;
      settings = {
        italic_font = "auto";
        bold_italic_font = "auto";
        mouse_hide_wait = 2;
        cursor_shape = "block";
        confirm_os_window_close = 0;
        background_opacity = "1.0";
        hide_window_decorations = "yes";
      };
      theme = "Catppuccin-Macchiato";
    };
  };
}
