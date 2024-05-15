{ config, ... }:
{
  home = {
    username = "zinc";
    homeDirectory = "/home/zinc";
  };
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
