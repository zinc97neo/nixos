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
    hyprland = {
      url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprscroller.url = "github:dawsers/hyprscroller";
    ags.url = "github:Aylur/ags";
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
