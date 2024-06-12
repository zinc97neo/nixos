{
  description = "Zinc's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nix-ld = {
      url = "github:Mic92/nix-ld";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-wsl = {
      url = "github:nix-community/NixOS-WSL";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    niri.url = "github:sodiboo/niri-flake";
    ags.url = "github:Aylur/ags";
    zincvim = {
      url = "github:zinc97neo/zincvim";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
    catppuccin.url = "github:catppuccin/nix?rev=96681f62faa285ad0c8dce2cdae6b0a1d0a8f094";
  };
  outputs = inputs @ { self, nixpkgs, ... }: import ./outputs {
    inherit inputs self nixpkgs;
  };
}
