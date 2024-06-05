{ pkgs, ... }:
let
  config = import ./config.nix;
in
{
  xdg.configFile."helix/themes" = {
    source = ./themes;
    recursive = true;
  };
  programs.helix = {
    enable = true;
    settings = config;
    languages = import ./languages {
      inherit pkgs;
    };
  };
}
