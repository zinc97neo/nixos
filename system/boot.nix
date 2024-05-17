{ pkgs, ... }:
{
  boot = {
    loader = {
      grub2-theme = {
        screen = "1080p";
        theme = "whitesur";
        splashImage = ../wallpaper/nixos-dark.png;
      };
      grub = {
        enable = true;
        device = "nodev";
        efiSupport = true;
        font = "${pkgs.jetbrains-mono}/share/fonts/truetype/JetBrainsMonoNL-Regular.ttf";
        fontSize = 30;
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
