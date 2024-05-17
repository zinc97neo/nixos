{ inputs, self, nixpkgs, ... }:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit inputs; };
  modules = [
    ../system/desktop.nix
    inputs.grub2-theme.nixosModules.default
    ../machines/desktop
    inputs.home-manager.nixosModules.home-manager
    ({ config, ... }: {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs; };
        sharedModules = [
          (../. + "/machines/${config.machine.userName}.nix")
        ];
        users.root = ../home/root.nix;
        users.${config.machine.userName} = {
          imports = [
            ../home/desktop.nix
          ] ++ [
            inputs.niri.homeModules.niri
            inputs.hyprland.homeManagerModules.default
          ];
        };
      };
    })
    {
      nixpkgs.overlays = [
        inputs.niri.overlays.niri
      ];
    }
  ];
}
