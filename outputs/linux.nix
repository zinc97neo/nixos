{ inputs, self, nixpkgs }:
let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
  };
  configuration = inputs.home-manager.lib.homeManagerConfiguration;
in
{
  "root" = configuration {
    inherit pkgs;
    modules = [ ../home/users/root.nix ];
  };
}
