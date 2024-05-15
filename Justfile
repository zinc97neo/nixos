# just is a command runner, Justfile is very similar to Makefile, but simpler.

############################################################################
#
#  Nix commands related to the local machine
#
############################################################################
fmt:
    # format the nix files in this repo
    sudo nix fmt

wsl: fmt
  sudo nixos-rebuild switch --flake . #wsl --show-trace --verbose

desktop: fmt
  sudo nixos-rebuild switch --flake . #desktop --show-trace --verbose

up:
  sudo nix flake update

gc:
  # garbage collect all unused nix store entries
  sudo nix store gc --debug
  sudo nix-collect-garbage --delete-old
