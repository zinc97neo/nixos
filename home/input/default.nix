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

  # home.file.".local/share/fcitx5/rime" = {
  #   source = ./rime;
  #   recursive = true;
  # };

  home.file.".local/share/fcitx5/themes" = {
    source = ./themes;
    executable = true;
    recursive = true;
  };


  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-gtk # gtk im module
        fcitx5-chinese-addons
        (fcitx5-rime.override {
          librime = librime-with-plugins;
        })
      ];
    };
  };
}
