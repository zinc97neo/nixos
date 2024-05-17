{ config, ... }:
let
  wallpaper = config.machine.wallpaper;
in
{
  programs.wpaperd = {
    enable = true;
    settings = {
      default = {
        mode = "stretch";
      };
      eDP-1 = {
        path = "${wallpaper}";
      };
      WL-1 = {
        path = "${wallpaper}";
      };
    };
  };
}
