{ pkgs, ... }:
{
  programs = {
    kitty = {
      enable = true;
      environment = { };
      keybindings = { };
      font = {
        name = "Maple Mono SC NF";
        size = 16;
      };
      settings = {
        mouse_hide_wait = 2;
        cursor_shape = "block";
        confirm_os_window_close = 0;
        background_opacity = "1.0";
        hide_window_decorations = "yes";
        shell = "${pkgs.zsh}/bin/zsh";
        disable_ligatures = "never";
      };
      extraConfig = ''
        font_features MapleMonoSCNF-Regular +cv01 +cv02 +cv03 +cv04 +ss01 +ss02 +ss03 +ss04 +ss05
        font_features MapleMonoSCNF-Bold +cv01 +cv02 +cv03 +cv04 +ss01 +ss02 +ss03 +ss04 +ss05
        font_features MapleMonoSCNF-Italic +cv01 +cv02 +cv03 +cv04 +ss01 +ss02 +ss03 +ss04 +ss05
        font_features MapleMonoSCNF-Light +cv01 +cv02 +cv03 +cv04 +ss01 +ss02 +ss03 +ss04 +ss05
        font_features MapleMonoSCNF-LightItalic +cv01 +cv02 +cv03 +cv04 +ss01 +ss02 +ss03 +ss04 +ss05
        font_features MapleMonoSCNF-BoldItalic +cv01 +cv02 +cv03 +cv04 +ss01 +ss02 +ss03 +ss04 +ss05
      '';
    };
  };
}
