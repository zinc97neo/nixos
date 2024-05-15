# just is a command runner, Justfile is very similar to Makefile, but simpler.

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################
wsl:
  sudo nixos-rebuild switch --flake . #wsl --show-trace --verbose

desktop:
  sudo nixos-rebuild switch --flake . #desktop --show-trace --verbose

up:
  sudo nix flake update

gc:
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old
