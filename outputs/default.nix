{ inputs, self, nixpkgs, ... }:
{
  formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
  nixosConfigurations = {
    wsl = import ./wsl.nix { inherit inputs self nixpkgs; };
    desktop = import ./desktop.nix { inherit inputs self nixpkgs; };
  };
  homeConfigurations = import ./linux.nix { inherit inputs self nixpkgs; };
}
