{ inputs, nixpkgs, ... }:
let
  system = "x86_64-linux";
  selfPkgs = import ../pkgs;
in
nixpkgs.lib.nixosSystem {
  inherit system;
  specialArgs = { inherit inputs; };
  modules = [
    ../system/desktop.nix
    ../machines/desktop
    inputs.home-manager.nixosModules.home-manager
    inputs.catppuccin.nixosModules.catppuccin
    inputs.nix-ld.nixosModules.nix-ld
    ({ config, ... }: {
      programs.nix-ld.dev.enable = true;
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        sharedModules = [
          (../. + "/machines/${config.machine.userName}.nix")
        ];
        users.root = {
          imports = [ ../home/users/root.nix ] ++ [ inputs.catppuccin.homeManagerModules.catppuccin ];
        };
        users.${config.machine.userName} = {
          imports = [
            ../home/users/desktop.nix
          ] ++ [
            inputs.catppuccin.homeManagerModules.catppuccin
          ];
        };
      };
    })
    {
      nixpkgs.overlays = [
        selfPkgs.overlay
      ];
    }
  ];
}
