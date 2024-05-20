{ pkgs, ... }:
{
  home.file.".config/.niri/" = {
    source = ./config;
    recursive = true;
    onChange = ''
      rm -rf ~/.config/niri && mkdir ~/.config/niri && cat ~/.config/.niri/* > ~/.config/niri/config.kdl
    '';
  };
  home.file.".niri-session" = {
    source = "${pkgs.niri}/bin/niri";
    executable = true;
  };
  home.file.".wshowkeys" = {
    text = ''
      #!/usr/bin/env bash
      wshowkeys -b#24273a33 -f#209fb5cc -s#8839efcc -aleft -abottom -m4 -t1 -F"JetBrainsMonoNL Nerd Font 48"
    '';
    executable = true;
  };
  home.file.".closewindow" = {
    source = ./closewindow;
    executable = true;
  };
  programs.niri = {
    enable = true;
    package = pkgs.niri-unstable;
    config = null;
  };
}
