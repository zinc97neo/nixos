{
  description = "Zinc's NixOS Configuration";
  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
      nixos-wsl = {
        url = "github:nix-community/NixOS-WSL";
        inputs.nixpkgs.follows = "nixpkgs";
      };
      home-manager.url = "github:nix-community/home-manager";
      helix.url = "github:helix-editor/helix/master";
    };
  outputs = inputs @ { self, nixpkgs, ... }: {
    formatter.x86_64-linux = nixpkgs.legacyPackages.x86_64-linux.nixpkgs-fmt;
    nixosConfigurations = {
      wsl = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          # include NixOS-WSL modules
          inputs.nixos-wsl.nixosModules.wsl
          ./system/wsl.nix
          ./machines/windows-terminal
          inputs.home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [
                (./. + "/machines/${config.machine.userName}.nix")
              ];
              users.root = ./home/root.nix;
              users.${config.machine.userName} = {
                imports = [
                  ./home/wsl.nix
                ] ++ [
                ];
              };
            };
          })
        ];
      };
      desktop = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit inputs; };
        modules = [
          ./system/desktop.nix
          ./machines/desktop
          inputs.home-manager.nixosModules.home-manager
          ({ config, ... }: {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = { inherit inputs; };
              sharedModules = [
                (./. + "/machines/${config.machine.userName}.nix")
              ];
              users.root = ./home/root.nix;
              users.${config.machine.userName} = {
                imports = [
                  ./home/desktop.nix
                ] ++ [
                ];
              };
            };
          })
        ];
      };
    };
  };
}
