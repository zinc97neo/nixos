# just is a command runner, Justfile is very similar to Makefile, but simpler.

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################
fmt:
  # format the nix files in this repo
  nix fmt

wsl: fmt
  nixos-rebuild switch --flake . #wsl --show-trace --verbose

desktop: fmt
  nixos-rebuild switch --flake . #desktop --show-trace --verbose

gentoo: fmt
  home-manager switch --flake .#root

up:
  nix flake update

gc:
  # garbage collect all unused nix store entries
  nix store gc --debug
  nix-collect-garbage --delete-old
