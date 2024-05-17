{ config, ... }:
let
  wallpaper = config.machine.wallpaper;
in
{
  programs.wpaperd = {
    enable = true;
    settings = {
      eDP-1 = {
        path = "${wallpaper}";
      };
    };
  };
}
