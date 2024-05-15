{ config, ... }:
let
  user = config.machine.userName;
in
{
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
