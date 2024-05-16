{ config, pkgs, ... }:
{
  home.username = "root";
  home.homeDirectory = "/root";
  imports = [
    ./core
    ./editor/helix
  ];
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
