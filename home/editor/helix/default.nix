{ pkgs, ... }:
let
  config = import ./config.nix;
in
{
  programs.helix = {
    enable = true;
    catppuccin.useItalics = true;
    settings = config;
    languages = import ./languages {
      inherit pkgs;
    };
  };
}
