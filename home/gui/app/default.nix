{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    pavucontrol
    blueberry
    neovide
  ];
  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };
    imv = {
      enable = true;
      settings = {
        aliases = {
          q = "close";
        };
      };
    };
  };
  xdg.configFile = {
    "neovide/config.toml" =
      let
        zincvim =
          inputs.zincvim.packages."${pkgs.system}".default;
        contet =
          builtins.replaceStrings [ "zincvim" ] [ "${zincvim}/bin/zincvim" ] (builtins.readFile ./neovide.toml);
      in
      {
        text = contet;
      };
  };
}
