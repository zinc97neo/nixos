{ inputs, pkgs, ... }:
let
  anyrun = inputs.anyrun.packages.${pkgs.system};
in
{
  programs.anyrun = {
    enable = true;
    config = with anyrun; {
      plugins = [
        applications
        randr
        rink
        shell
        symbols
        translate
      ];
      x = { fraction = 0.5; };
      y = { fraction = 0.1; };
      width = { fraction = 0.4; };
      hidePluginInfo = true;
      closeOnClick = true;
      layer = "overlay";
    };
    extraCss = builtins.readFile ./anyrun.css;
  };
}
