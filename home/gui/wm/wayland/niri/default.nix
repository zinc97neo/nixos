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
  home.packages = with pkgs; [
    cage
    qutebrowser
    (wechat-uos.override {
      uosLicense = pkgs.fetchurl {
        url = "https://aur.archlinux.org/cgit/aur.git/plain/license.tar.gz?h=wechat-uos-bwrap";
        hash = "sha256-U3YAecGltY8vo9Xv/h7TUjlZCyiIQdgSIp705VstvWk=";
      };
    })
  ];
}
