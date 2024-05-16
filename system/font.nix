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
      (nerdfonts.override { fonts = [ "FiraCode" "CodeNewRoman" "ComicShannsMono" "JetBrainsMono" ]; })
    ];

    fontconfig.defaultFonts = pkgs.lib.mkForce {
      serif = [ "Noto Serif" "Noto Serif CJK SC" ];
      sansSerif = [ "Noto Sans" "Noto Sans CJK SC" ];
      monospace = [ "JetBrainsMonoNL Nerd Font" ];
      emoji = [ "Noto Color Emoji" ];
    };
  };
  console.font = "${pkgs.tamsyn}/share/consolefonts/Tamsyn10x20r.psf.gz";
}
