{
  description = "Zinc's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager";
    niri.url = "github:sodiboo/niri-flake";
    grub2-theme = {
      url = "github:vinceliuice/grub2-themes";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ { self, nixpkgs, ... }: import ./outputs {
    inherit inputs self nixpkgs;
  };
}
