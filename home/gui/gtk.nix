{ config, ... }:
{
  gtk = {
    enable = true;
    cursorTheme = {
      size = 48;
    };
    font = {
      name = "Maple Mono SC NF";
      size = 16;
    };
    gtk3.extraCss = ''
      headerbar, .titlebar,
      .csd:not(.popup):not(tooltip):not(messagedialog) decoration{
        border-radius: 0;
      }
    '';
    gtk4.extraCss = ''
      window.messagedialog .response-area > button,
      window.dialog.message .dialog-action-area > button,
      .background.csd{
        border-radius: 0;
      }
    '';
    gtk2.configLocation = "${config.xdg.configHome}/gtk-2.0/gtkrc";
    gtk3.extraConfig.gtk-application-prefer-dark-theme = true;
    gtk4.extraConfig.gtk-application-prefer-dark-theme = true;
  };
  qt = {
    enable = true;
    platformTheme.name = "kvantum";
    style.name = "kvantum";
  };
  home.sessionVariables = {
    QT_AUTO_SCREEN_SCALE_FACTOR = "1";
    CALIBRE_USE_DARK_PALETTE = "1";
  };
  xdg.configFile = {
    "gtk-4.0/assets".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/assets";
    "gtk-4.0/gtk.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk.css";
    "gtk-4.0/gtk-dark.css".source = "${config.gtk.theme.package}/share/themes/${config.gtk.theme.name}/gtk-4.0/gtk-dark.css";
  };
}
