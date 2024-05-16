{ pkgs, ... }:
{
  imports = [
    ./gtk.nix
    ./wm
  ];
}
