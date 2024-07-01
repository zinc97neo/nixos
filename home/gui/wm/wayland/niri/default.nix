{ pkgs, ... }:
{
  home.packages = with pkgs; [
    niri
  ];
  home.file.".config/.niri/" = {
    source = ./config;
    recursive = true;
    onChange = ''
      rm -rf ~/.config/niri && mkdir ~/.config/niri && cat ~/.config/.niri/* > ~/.config/niri/config.kdl
    '';
  };
  home.file.".wshowkeys" = {
    text = ''
      #!/usr/bin/env bash
      wshowkeys -b#24273a33 -f#209fb5cc -s#8839efcc -aleft -abottom -m4 -t1 -F"JetBrainsMonoNL Nerd Font 48"
    '';
    executable = true;
  };
  home.file.".fcitx5-restart" = {
    text = ''
      #!/usr/bin/env bash
      pkill fcitx5 -9; sleep 1; fcitx5 -d --replace; sleep 1; fcitx5-remote -r
    '';
    executable = true;
  };
}
