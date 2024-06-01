{ pkgs, ... }:
{
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
}
