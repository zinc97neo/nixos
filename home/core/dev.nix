{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # nix lsp
    nixpkgs-fmt
    nil
  ];
}
