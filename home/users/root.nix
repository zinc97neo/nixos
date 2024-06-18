{ config, ... }:
let
  catppuccin = config.machine.catppuccin;
in
{
  home.username = "root";
  home.homeDirectory = "/root";
  imports = [
    ../core
    ../editor/helix
  ];
  catppuccin = catppuccin;
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
