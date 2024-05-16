{ pkgs, ... }:
{
  imports = [
    ./base.nix
    ./boot.nix
    ./user.nix
    ./i18n.nix
    ./font.nix
    ./security.nix
    ./services.nix
  ];
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };
  programs = {
    dconf.enable = true;
    light.enable = true;
  };
  location.provider = "geoclue2";
  xdg.portal = {
    enable = true;
    # xdgOpenUsePortal = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
      xdg-desktop-portal-wlr
    ];
    config = {
      common.default = [ "gtk" ];
    };
  };
}
