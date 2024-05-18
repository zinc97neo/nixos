{ inputs, self, nixpkgs }:
let
  system = "x86_64-linux";
  pkgs = nixpkgs.legacyPackages.${system};
  configuration = inputs.home-manager.lib.homeManagerConfiguration;
in
{
  "root" = configuration {
    inherit pkgs;
    modules = [ ../home/users/root.nix ];
  };
}
