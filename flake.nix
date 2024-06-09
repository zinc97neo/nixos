{
  description = "Zinc's NixOS Configuration";
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
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
    anyrun.url = "github:Kirottu/anyrun";
    anyrun-plugins = {
      url = "github:wuliuqii/anyrun-plugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    zincvim = {
      url = "github:zinc97neo/zincvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    catppuccin.url = "github:catppuccin/nix";
  };
  outputs = inputs @ { self, nixpkgs, ... }: import ./outputs {
    inherit inputs self nixpkgs;
  };
}
