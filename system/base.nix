{ pkgs, ... }:
{
  environment = {
    variables.EDITOR = "hx";
    systemPackages = with pkgs; [
      vim
      helix # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      git
      gnumake
      wget
      just # a command runner(replacement of gnumake in some cases)
      curl
      unzip
      gnutar
      gzip
    ];
  };
  time.timeZone = "Asia/Shanghai";
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
      channel = "https://nixos.org/channels/nixos-unstable";
    };
    stateVersion = "24.05";
  };
}
