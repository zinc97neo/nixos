{ pkgs, ... }:
{
  i18n = {
    defaultLocale = "en_US.UTF-8";
    inputMethod = {
      enabled = "fcitx5";
      fcitx5 = {
        waylandFrontend = true;
        addons = with pkgs; [
          fcitx5-gtk # gtk im module
          fcitx5-chinese-addons
          (fcitx5-rime.override {
            librime = librime-with-plugins;
            rimeDataPkgs = [
              rime-ice
            ];
          })
        ];
      };
    };
  };
}
