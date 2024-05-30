{ ... }:
{
  home.file.".config/alacritty/theme" = {
    source = ../themes/alacritty;
    recursive = true;
  };
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "zsh";
      env.TERM = "xterm-256color";
      terminal.osc52 = "CopyPaste";
      import = [
        "~/.config/alacritty/theme/catppuccin-macchiato.toml"
      ];
      font = {
        size = 14.0;
        normal.family = "JetBrainsMono Nerd Font";
      };
      window = {
        dynamic_padding = false;
        opacity = 1.0;
        blur = false;
        padding = { x = 0; y = 0; };
      };
      cursor = {
        style = {
          blinking = "Always";
        };
        blink_timeout = 0;
        unfocused_hollow = false;
        thickness = 0.1;
      };
    };
  };
}
