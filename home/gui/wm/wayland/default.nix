{ pkgs, ... }:
{
  imports = [
    ./niri
  ];
  # make stuff work on wayland
  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland";
    SDL_VIDEODRIVER = "wayland";
    XDG_SESSION_TYPE = "wayland";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";
    NIXOS_OZONE_WL = "1";
    MOZ_ENABLE_WAYLAND = "1";
    MOZ_WEBRENDER = "1";
    _JAVA_AWT_WM_NONREPARENTING = "1";
    XCURSOR_SIZE = "48";
  };
  home.packages = with pkgs; [
    hyprland
  ];
}
