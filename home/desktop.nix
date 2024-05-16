{ config, ... }:
let
  user = config.machine.userName;
  editor = config.machine.editor;
  browser = config.machine.browser;
  terminal = config.machine.terminal;
in
{
  imports = [
    ./core
    ./editor
  ];
  home = {
    username = "${user}";
    homeDirectory = "/home/${user}";
    sessionVariables = {
      EDITOR = "${editor}";
      BROWSER = "${browser}";
      TERMINAL = "${terminal}";
    };
  };
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
