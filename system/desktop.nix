{ pkgs, config, ... }:
{
  imports = [
    ./base.nix
    ./boot.nix
    ./user.nix
    ./i18n.nix
    ./font.nix
    ./security.nix
    ./services.nix
    ./hardware.nix
  ];
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };
  programs = {
    dconf.enable = true;
    light.enable = true;
  };
  environment.systemPackages = with pkgs; [ zinc-custom ];
  services = {
    xserver = {
      enable = false;
      videoDrivers = [ "amdgpu" ];
    };
    displayManager = {
      enable = true;
      sessionPackages = [ pkgs.niri-unstable ];
      defaultSession = "niri";
      sddm = {
        enable = true;
        catppuccin.enable = false;
        wayland.enable = true;
        settings = {
          Autologin = {
            User = config.machine.userName;
          };
        };
        theme = "${config.machine.catppuccin.flavor}";
      };
    };
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
