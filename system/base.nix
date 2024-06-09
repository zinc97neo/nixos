{ pkgs, config, ... }:
{
  environment = {
    variables.EDITOR = "hx";
    systemPackages = with pkgs; [
      helix # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      git
      gnumake
      wget
      just # a command runner(replacement of gnumake in some cases)
      curl
      unzip
      gnutar
      gzip
      nvfetcher
      fontforge
      psftools
    ];
  };
  time.timeZone = "Asia/Shanghai";
  nixpkgs.config = {
    allowUnfree = true;
    permittedInsecurePackages = [
      "openssl-1.1.1w"
    ];
  };
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      options = "--delete-older-than 2d";
    };
  };
  system = {
    autoUpgrade = {
      enable = true;
      channel = "https://nixos.org/channels/nixos-24.05";
    };
    stateVersion = "24.05";
  };
  catppuccin = config.machine.catppuccin;
}
