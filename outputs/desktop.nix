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
    inputs.grub2-theme.nixosModules.default
    ../machines/desktop
    inputs.home-manager.nixosModules.home-manager
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
        users.root = ../home/users/root.nix;
        users.${config.machine.userName} = {
          imports = [
            ../home/users/desktop.nix
          ] ++ [
            inputs.ags.homeManagerModules.default
            inputs.anyrun.homeManagerModules.default
            inputs.niri.homeModules.niri
            inputs.nixvim.homeManagerModules.nixvim
          ];
        };
      };
    })
    {
      nixpkgs.overlays = [
        inputs.niri.overlays.niri
        selfPkgs.overlay
      ];
    }
  ];
}
