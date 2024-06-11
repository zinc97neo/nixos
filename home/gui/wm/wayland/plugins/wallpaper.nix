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
      any = {
        path = "${wallpaper}";
      };
    };
  };
}
