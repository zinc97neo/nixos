{ ... }:
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "${./catppuccin-logo480x480.png}";
        type = "kitty-direct";
        printRemaining = true;
      };
      display = {
        binaryPrefix = "si";
        color = "blue";
        separator = " => ";
      };
      modules = [
        {
          type = "title";
          keyWidth = 10;
        }
        {
          type = "os";
          key = " ";
          keyColor = "yellow";
          format = "{2} - {8}";
        }
        {
          type = "kernel";
          key = " ";
          keyColor = "red";
          format = "{1} - {2}";
        }
        {
          type = "packages";
          key = " ";
          keyColor = "green";
          format = "all - {1} | nix-system - {9}";
        }
        {
          type = "wm";
          key = " ";
          keyColor = "cyan";
          format = "{2} - {3}";
        }
        {
          type = "terminal";
          key = " ";
          format = "{5} - {6}";
        }
        {
          type = "cpu";
          key = "󰻠 ";
          keyColor = "red";
        }
        {
          type = "theme";
          key = "󰉼 ";
          keyColor = "green";
        }
        {
          type = "font";
          key = " ";
          keyColor = "yellow";
          format = "{5}";
        }
        {
          type = "shell";
          key = " ";
          format = "{1} - {4}";
        }
      ];
    };
  };
}
