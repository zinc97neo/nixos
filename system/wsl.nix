{ config, lib, pkgs, ... }:
{
  imports = [
  ];
  wsl.enable = true;
  wsl.defaultUser = "zinc";
  environment.systemPackages = with pkgs; [
    helix # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    git
    gnumake
    wget
    just # a command runner(replacement of gnumake in some cases)
    curl
  ];
  networking = {
    hostName = "wsl";
    networkmanager.enable = true;
  };
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      options = "--delete-older-than 2d";
    };
  };
  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "24.05";
  };
}
