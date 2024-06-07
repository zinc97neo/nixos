{ pkgs, ... }:
{
  programs = {
    kitty = {
      enable = true;
      environment = { };
      keybindings = { };
      font = {
        name = "Maple Mono SC NF";
        size = 16;
      };
      settings = {
        mouse_hide_wait = 2;
        cursor_shape = "block";
        confirm_os_window_close = 0;
        background_opacity = "1.0";
        hide_window_decorations = "yes";
        shell = "${pkgs.zsh}/bin/zsh";
      };
      theme = "Catppuccin-Macchiato";
    };
  };
}
