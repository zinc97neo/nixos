{ pkgs, ... }:
{
  home.packages = with pkgs; [
  ];
  programs.ags = {
    enable = true;
  };
}
