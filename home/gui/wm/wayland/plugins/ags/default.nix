{ pkgs, ... }:
{
  home.packages = with pkgs; [
    ags
  ];
}
