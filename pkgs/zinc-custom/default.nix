{ sources, lib, stdenvNoCC, }:
stdenvNoCC.mkDerivation {
  inherit (sources.zinc-custom) pname version src;

  dontBuild = true;
  dontConfigure = true;

  installPhase = "
    mkdir -p $out
    cp -r $src/* $out/
  ";

  meta = with lib; {
    description = "❄️ A collection of miscellaneous files for NixOS, including GRUB themes, TTY fonts, and more. ❄️";
    homepage = "https://github.com/zinc97neo/nixos-customizations";
    license = licenses.mit;
  };
}
