{ config, ... }:
let
  user = config.machine.userName;
  editor = config.machine.editor;
  browser = config.machine.browser;
  terminal = config.machine.terminal;
  catppuccin = config.machine.catppuccin;
in
{
  imports = [
    ../core
    ../editor
    ../gui
    ../input
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
  catppuccin = catppuccin;
  programs.home-manager.enable = true;
  home.stateVersion = "24.05";
}
