{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      source-han-sans
      jetbrains-mono
      roboto
      nerdfonts
    ];

    fontconfig.defaultFonts = pkgs.lib.mkForce {
      serif = [ "JetBrainsMono Nerd Font" "Noto Serif" "Noto Serif CJK SC" ];
      sansSerif = [ "JetBrainsMono Nerd Font" "Noto Sans" "Noto Sans CJK SC" ];
      monospace = [ "JetBrainsMono Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-i32b.psf.gz";
}
