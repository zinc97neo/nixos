{ ... }:
{
  home.file.".config/waybar" = {
    source = ./config;
    recursive = true;
  };
  programs.waybar = {
    enable = true;
  };
}
