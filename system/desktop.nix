{ pkgs, config, ... }:
let
  Catppuccin = config.machine.Catppuccin;
  CursorTheme = "Catppuccin-${Catppuccin.Flavor}-${Catppuccin.Accent}-Cursors";
in
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
          Theme = {
            CursorTheme = CursorTheme;
            CursorSize = 96;
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
