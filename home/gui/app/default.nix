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
        options = {
          background = "24273a";
          overlay_text_color = "cad3f5";
          overlay_background_color = "181926";
        };
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
        # content = builtins.replaceStrings "zincvim" "${zincvim}/bin/zincvim" (builtins.readFile ./neovide.toml);
        content = builtins.readFile ./neovide.toml;
        last-contet =
          builtins.replaceStrings [ "zincvim" ] [ "${zincvim}/bin/zincvim" ] content;
      in
      {
        text = last-contet;
      };
  };
}
