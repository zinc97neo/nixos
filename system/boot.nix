{ pkgs, ... }:
{
  boot = {
    loader = {
      grub2-theme = {
        screen = "4k";
        theme = "vimix";
        icon = "color";
        splashImage = ../wallpaper/catppuccin.jpg;
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
      };
      efi = {
        canTouchEfiVariables = true;
        efiSysMountPoint = "/boot";
      };
      timeout = 3;
    };
    kernelPackages = pkgs.linuxPackages_latest;
    kernelParams = [
      "quiet"
      "splash"
    ];
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}

