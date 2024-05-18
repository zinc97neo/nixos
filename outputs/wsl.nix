{ inputs, self, nixpkgs, ... }:
nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  specialArgs = { inherit inputs; };
  modules = [
    # include NixOS-WSL modules
    inputs.nixos-wsl.nixosModules.wsl
    ../system/wsl.nix
    ../machines/windows-terminal
    inputs.home-manager.nixosModules.home-manager
    ({ config, ... }: {
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
            ../home/users/wsl.nix
          ] ++ [
          ];
        };
      };
    })
  ];
}
