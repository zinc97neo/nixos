{ ... }:
{
  imports = [
    ./base.nix
    ./user.nix
  ];
  networking = {
    hostName = "desktop";
    networkmanager.enable = true;
  };
}
