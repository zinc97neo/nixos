{ sources, lib, stdenvNoCC, libsForQt5 }:
stdenvNoCC.mkDerivation {
  inherit (sources.zinc-custom) pname version src;

  dontBuild = true;
  dontConfigure = true;
  dontWrapQtApps = true;

  propagatedBuildInputs = with libsForQt5.qt5; [
    qtgraphicaleffects
    qtquickcontrols2
    qtsvg
  ];

  postFixup = ''
    mkdir -p $out/nix-support
    echo ${libsForQt5.qt5.qtgraphicaleffects}  >> $out/nix-support/propagated-user-env-packages
    echo ${libsForQt5.qt5.qtquickcontrols2}  >> $out/nix-support/propagated-user-env-packages
    echo ${libsForQt5.qt5.qtsvg}  >> $out/nix-support/propagated-user-env-packages
  '';

  installPhase = ''
    runHook preInstall
    mkdir -p "$out/"{,share/sddm/{themes,icons,faces},share/icons}
    cp -r $src/grub $out/
    cp -r $src/sddm/themes/* $out/share/sddm/themes/
    cp -r $src/sddm/icons/* $out/share/sddm/icons/
    cp -r $src/sddm/icons/* $out/share/sddm/faces/
    cp -r $src/cursors/* $out/share/icons
    runHook postInstall
  '';

  meta = with lib; {
    description = "❄️ A collection of miscellaneous files for NixOS, including GRUB themes, TTY fonts, and more. ❄️";
    homepage = "https://github.com/zinc97neo/nixos-customizations";
    license = licenses.mit;
  };
}
