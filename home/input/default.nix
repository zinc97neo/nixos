{ pkgs, ... }:
{
  xdg.configFile = {
    "fcitx5/profile" = {
      source = ./profile;
      # every time fcitx5 switch input method, it will modify ~/.config/fcitx5/profile,
      # so we need to force replace it in every rebuild to avoid file conflict.
      force = true;
    };
    "fcitx5/config".source = ./config;
    "fcitx5/conf/classicui.conf".source = ./classicui.conf;
  };

  home.file.".local/share/fcitx5/themes" = {
    source = ./themes;
    executable = true;
    recursive = true;
  };


}
