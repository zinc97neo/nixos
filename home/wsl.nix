{ config, ... }:
let
  user = config.machine.userName;
in
{
  imports = [
    ./core
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
