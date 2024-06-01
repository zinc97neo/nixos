{ ... }:
{
  programs.qutebrowser = {
    enable = true;
    extraConfig = builtins.readFile ./qutebrowser.py;
  };
}
