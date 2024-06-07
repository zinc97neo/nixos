{ pkgs, ... }:
{
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-cjk-serif
      noto-fonts-emoji
      maple-mono-SC-NF
      roboto
    ];

    fontconfig.defaultFonts = pkgs.lib.mkForce {
      serif = [ "Maple Mono SC NF" "Noto Serif" "Noto Serif CJK SC" ];
      sansSerif = [ "Maple Mono SC NF" "Noto Sans" "Noto Sans CJK SC" ];
      monospace = [ "Maple Mono SC NF" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
  console.font = "${pkgs.terminus_font}/share/consolefonts/ter-i32b.psf.gz";
}
