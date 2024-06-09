{ pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      shell.program = "${pkgs.zsh}/bin/zsh";
      env.TERM = "xterm-256color";
      terminal.osc52 = "CopyPaste";
      font = {
        size = 14.0;
        normal.family = "Maple Mono SC NF";
        normal.style = "Regular";
        bold.family = "Maple Mono SC NF";
        bold.style = "Bold";
        italic.family = "Maple Mono SC NF";
        italic.style = "Italic";
        bold_italic.family = "Maple Mono SC NF";
        bold_italic.style = "Bold Italic";
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
