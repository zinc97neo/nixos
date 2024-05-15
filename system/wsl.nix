{ config, lib, pkgs, ... }:
{
  imports = [
    ./base.nix
    ./user.nix
  ];
  wsl = {
    enable = true;
    wslConf.automount.root = "/mnt";
    wslConf.interop.appendWindowsPath = false;
    wslConf.network.generateHosts = false;
    defaultUser = "zinc";
    startMenuLaunchers = true;
    # Enable integration with Docker Desktop (needs to be installed)
    docker-desktop.enable = false;
  };
  networking = {
    hostName = "wsl";
    networkmanager.enable = true;
  };
}
