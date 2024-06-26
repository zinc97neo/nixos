{ config, ... }:
let
  user = config.machine.userName;
in
{
  imports = [
    ../core
    ../editor/helix
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
  };
  programs.home-manager.enable = true;
  home.stateVersion = "24.11";
}
