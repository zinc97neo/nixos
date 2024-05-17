{ pkgs, ... }:
{
  home.sessionVariables = {
    GDK_SCALE = "2";
  };
  wayland.windowManager.hyprland = {
    enable = true;
    settings = {
      env = [
        "NIXOS_OZONE_WL,1" # for any ozone-based browser & electron apps to run on wayland
        "MOZ_ENABLE_WAYLAND,1" # for firefox to run on wayland
        "MOZ_WEBRENDER,1"
        # misc
        "_JAVA_AWT_WM_NONREPARENTING,1"
        "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
        "QT_QPA_PLATFORM,wayland"
        "SDL_VIDEODRIVER,wayland"
        "GDK_BACKEND,wayland"
        "XDG_SESSION_TYPE,wayland"
        "XDG_CURRENT_DESKTOP,Hyprland"
        "XDG_SESSION_DESKTOP,Hyprland"
      ];
    };
    xwayland.enable = true;
    systemd.enable = true;
    extraConfig = builtins.readFile ./hyprland.conf;
  };

  xdg.configFile = {
    "hypr/conf" = {
      source = ./conf;
      recursive = true;
    };
  };

  # NOTE: this executable is used by greetd to start a wayland session when system boot up
  # with such a vendor-no-locking script, we can switch to another wayland compositor without modifying greetd's config in NixOS module
  home.file.".hyprland-session" = {
    source = "${pkgs.hyprland}/bin/Hyprland";
    executable = true;
  };

  home.packages = with pkgs; [
    xdg-desktop-portal-hyprland
    # dependencies
    hyprland-protocols
  ];
}
