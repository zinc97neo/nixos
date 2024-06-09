{ pkgs, config, ... }:
let
  theme =
    "${pkgs.zinc-custom}/grub/${config.machine.catppuccin.flavor}";
in
{
  boot = {
    loader = {
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        catppuccin.enable = false;
        theme = theme;
        splashImage = "${theme}/background.png";
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
    plymouth.enable = true;
    consoleLogLevel = 0;
    initrd.verbose = false;
  };
}

