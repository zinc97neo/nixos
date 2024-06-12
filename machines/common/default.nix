{ lib, ... }:
with lib;
{
  options.machine = {
    userName = mkOption {
      type = types.str;
    };
    userEmail = mkOption {
      type = types.str;
    };
    hashedPassword = mkOption {
      type = types.str;
    };
    browser = mkOption {
      type = types.str;
    };
    terminal = mkOption {
      type = types.str;
    };
    editor = mkOption {
      type = types.str;
    };
    shell = mkOption {
      type = types.package;
    };
    wallpaper = mkOption {
      type = types.path;
    };
    catppuccin = {
      enable = mkOption {
        type = types.bool;
      };
      accent = mkOption {
        type = types.str;
      };
      flavor = mkOption {
        type = types.str;
      };
    };
    Catppuccin = {
      Accent = mkOption {
        type = types.str;
      };
      Flavor = mkOption {
        type = types.str;
      };
    };
  };
}
