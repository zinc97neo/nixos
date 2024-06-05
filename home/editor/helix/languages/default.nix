{ pkgs }:
let
  configDir = ./config;
  languageFiles = builtins.filter
    (file: builtins.match ".+\\.nix$" file != null)
    (builtins.attrNames (builtins.readDir configDir));
  importFile = file: import "${configDir}/${file}";
  language = builtins.map importFile languageFiles;
in
{
  language = language;
  language-server = import ./server.nix {
    inherit pkgs;
  };
  grammer = import ./grammer.nix;
}
