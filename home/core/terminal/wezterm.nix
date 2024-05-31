{ ... }:
{
  programs.wezterm = {
    enable = true;
    extraConfig = ''
      local Config = require('config')
      return Config:init()
        :append(require('config.appearance')).options
    '';
  };

  home.file.".config/wezterm/config" = {
    source = ./wezterm-config;
    recursive = true;
  };
}
